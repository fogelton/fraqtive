/*
 *
 * Copyright (c) 2015 Andrej Fogelton

adjusted the work of

Copyright (c) 2013 Raivis Strogonovs

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.*/



#include "smtpclient.h"
#include <QCoreApplication>
SmtpClient::SmtpClient(const QString &user, const QString &pass, const QString &host, int port, int timeout , QWidget *p): QWidget(p)
{    
    socket = new QSslSocket(this);
    m_log_manager = QLogger::QLoggerManager::getInstance();
    m_log_manager->addDestination(QCoreApplication::applicationDirPath().append("/logs.log"),  QStringList("smtp"), QLogger::InfoLevel);

    connect(socket, SIGNAL(readyRead()), this, SLOT(readyRead()));
    connect(socket, SIGNAL(connected()), this, SLOT(connected() ) );
    connect(socket, SIGNAL(error(QAbstractSocket::SocketError)), this,SLOT(errorReceived(QAbstractSocket::SocketError)));
    connect(socket, SIGNAL(stateChanged(QAbstractSocket::SocketState)), this, SLOT(stateChanged(QAbstractSocket::SocketState)));
    connect(socket, SIGNAL(disconnected()), this,SLOT(disconnected()));

    this->user = user;
    this->pass = pass;
    this->host = host;
    this->port = port;
    this->timeout = timeout;
    m_progress=new QProgressDialog(this);
    m_progress->setWindowModality( Qt::WindowModal );
    m_progress->setRange( 0, 10 );
    m_progress->setWindowTitle( tr( "Sending email" ) );
    m_progress->setLabelText( tr( "Sending..." ) );
    m_progress->setFixedHeight( m_progress->sizeHint().height() );
    m_progress->resize( 300, m_progress->height() );
    m_progress->setCancelButton(0);
}

void SmtpClient::sendMail(const QString &from, const QString &to, const QString &subject, const QString &body)
{
    m_progress->show();
    m_progress->raise();
    m_progress->activateWindow();
    m_progress->setValue(0);
    message = "To: " + to + "\n";
    message.append("From: " + from + "\n");
    message.append("Subject: " + subject + "\n\n");
    message.append(body);
    message.replace( QString::fromLatin1( "\n" ), QString::fromLatin1( "\r\n" ) );
    message.replace( QString::fromLatin1( "\r\n.\r\n" ), QString::fromLatin1( "\r\n..\r\n" ) );
    this->from = from;
    rcpt = to;
    state = Init;
    socket->connectToHostEncrypted(host, port); //"smtp.gmail.com" and 465 for gmail TLS
    if (!socket->waitForConnected(timeout))
    {
        QLogger::QLog_Error("smtp",socket->errorString());
    }
    t = new QTextStream( socket );
}
SmtpClient::~SmtpClient()
{

}
void SmtpClient::stateChanged(QAbstractSocket::SocketState socketState)
{
    qDebug() <<"stateChanged " << socketState;
}

void SmtpClient::errorReceived(QAbstractSocket::SocketError socketError)
{
    qDebug() << "error " <<socketError;
}

void SmtpClient::disconnected()
{
    qDebug() <<"disconneted";
    qDebug() << "error "  << socket->errorString();
    if(state!=Close)
        QLogger::QLog_Error("smtp",socket->errorString());
}

void SmtpClient::connected()
{    
    qDebug() << "Connected ";
}

void SmtpClient::readyRead()
{
    qDebug() <<"readyRead";
    // SMTP is line-oriented
    QString responseLine;
    do
    {
        responseLine = socket->readLine();
        response += responseLine;
    }
    while ( socket->canReadLine() && responseLine[3] != ' ' );

    responseLine.truncate( 3 );

    qDebug() << "Server response code:" <<  responseLine;
    qDebug() << "Server response: " << response;

    if ( state == Init && responseLine == "220" )
    {
        m_progress->setValue(1);
        // banner was okay, let's go on
        *t << "EHLO localhost" <<"\r\n";
        t->flush();
        state = HandShake;
    }
    //No need, because I'm using socket->startClienEncryption() which makes the SSL handshake for you
    /*else if (state == Tls && responseLine == "250")
    {
        // Trying AUTH
        qDebug() << "STarting Tls";
        *t << "STARTTLS" << "\r\n";
        t->flush();
        state = HandShake;
    }*/
    else if (state == HandShake && responseLine == "250")
    {
        m_progress->setValue(2);
        socket->startClientEncryption();
        if(!socket->waitForEncrypted(timeout))
        {
            state = Close;
        }
        //Send EHLO once again but now encrypted
        *t << "EHLO localhost" << "\r\n";
        t->flush();
        state = Auth;
    }
    else if (state == Auth && responseLine == "250")
    {
        m_progress->setValue(3);
        // Trying AUTH
        qDebug() << "Auth";
        *t << "AUTH LOGIN" << "\r\n";
        t->flush();
        state = User;
    }
    else if (state == User && responseLine == "334")
    {
        m_progress->setValue(4);
        //Trying User
        qDebug() << "Username";
        //GMAIL is using XOAUTH2 protocol, which basically means that password and username has to be sent in base64 coding
        //https://developers.google.com/gmail/xoauth2_protocol
        *t << QByteArray().append(user).toBase64()  << "\r\n";
        t->flush();
        state = Pass;
    }
    else if (state == Pass && responseLine == "334")
    {
        m_progress->setValue(5);
        //Trying pass
        qDebug() << "Pass";
        *t << QByteArray().append(pass).toBase64() << "\r\n";
        t->flush();
        state = Mail;
    }
    else if ( state == Mail && responseLine == "235" )
    {
        m_progress->setValue(6);
        // HELO response was okay (well, it has to be)
        //Apperantly for Google it is mandatory to have MAIL FROM and RCPT email formated the following way -> <email@gmail.com>
        qDebug() << "MAIL FROM:<" << from << ">";
        *t << "MAIL FROM:<" << from << ">\r\n";
        t->flush();
        state = Rcpt;
    }
    else if ( state == Rcpt && responseLine == "250" )
    {
        m_progress->setValue(7);
        //Apperantly for Google it is mandatory to have MAIL FROM and RCPT email formated the following way -> <email@gmail.com>
        *t << "RCPT TO:<" << rcpt << ">\r\n"; //r
        t->flush();
        state = Data;
    }
    else if ( state == Data && responseLine == "250" )
    {
        m_progress->setValue(8);
        *t << "DATA\r\n";
        t->flush();
        state = Body;
    }
    else if ( state == Body && responseLine == "354" )
    {
        m_progress->setValue(9);
        *t << message << "\r\n.\r\n";
        t->flush();
        state = Quit;
    }
    else if ( state == Quit && responseLine == "250" )
    {
        m_progress->setValue(10);
        *t << "QUIT\r\n";
        t->flush();
        // here, we just close.
        state = Close;
        emit emailSent( true );
    }
    else if ( state == Close )
    {
        // deleteLater();
        return;
    }
    else
    {
        // something broke.
        QLogger::QLog_Error("smtp", response );
        state = Close;
        emit emailSent( false );
    }
    response = "";
}
