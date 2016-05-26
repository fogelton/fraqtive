/*
Copyright (c) 2015 Andrej Fogelton

adjusted the work from internet
*/

#include "ftpuploader.h"
#include <QMessageBox>
#include <QTimer>
FtpUploader::FtpUploader(QString username, QString password, QString server, int port, QWidget *p ): QWidget(p)
{
    m_port=port;
    m_server=server;
    m_username=username;
    m_password=password;
    m_log_manager = QLogger::QLoggerManager::getInstance();
    m_log_manager->addDestination(QCoreApplication::applicationDirPath().append("/logs.log"),  QStringList("ftp"), QLogger::InfoLevel);
    m_progress=new QProgressDialog(this);
    m_progress->setWindowModality( Qt::WindowModal );
    m_progress->setWindowTitle( tr( "Uploading file to server" ) );
    m_progress->setLabelText( tr( "Uploading..." ) );
    m_progress->setFixedHeight( m_progress->sizeHint().height() );
    m_progress->resize( 300, m_progress->height() );

}
FtpUploader::~FtpUploader()
{
    m_reply->deleteLater();
}

void FtpUploader::uploadFile(const QString fileName,const QString &urlFileName)  //OK NO PROBLEM
{
    QUrl url(urlFileName);
    url.setUserName(m_username);
    url.setPort(m_port);
    url.setPassword(m_password);

    m_data = new QFile(fileName, this);
    if (m_data->open(QIODevice::ReadOnly))
    {
        m_progress->setRange(0,m_data->size());
        m_progress->setValue(0);
        m_progress->show();
        m_progress->raise();
        m_progress->activateWindow();
        m_uploadFinished=false;
        m_reply = m_nam.put(QNetworkRequest(url), m_data);
        connect(m_reply, SIGNAL(uploadProgress(qint64, qint64)),this, SLOT(displayProgress(qint64, qint64)));

        QEventLoop loop(this);
        connect(m_progress, SIGNAL(canceled()),&loop, SLOT(quit()));
        connect(m_reply, SIGNAL(finished()),&loop, SLOT(quit()));
        loop.exec();


        if(m_reply->error()==QNetworkReply::NoError && !m_progress->wasCanceled())
        {
            //emit uploadSucess(true);
            QMessageBox m;
            m.setIcon(QMessageBox::Information);
            m.setText(tr("Fractal is uploaded successfully."));
            QTimer::singleShot(5000, &m, SLOT(accept()));
            m.exec();

        }
        else
        {
            if(m_progress->wasCanceled())
                m_reply->abort();
            if(!m_progress->wasCanceled())//in a case if something is received after abort
                m_progress->cancel();
            QLogger::QLog_Error("ftp",m_reply->errorString());
            QMessageBox m;
            m.setIcon(QMessageBox::Information);
            m.setText(tr("Network error, please contact support."));
            m.exec();
          //  emit uploadSucess(false);
        }
        qDebug() << "Finished" << m_reply->error();
        qDebug() << "Finished" << m_reply->errorString();
        m_data->deleteLater();
        m_reply->deleteLater();
    }
    else
    {
        QLogger::QLog_Error("ftp",QString("can not open file to send"));
        qDebug() << "can not open file";
    }
}
void FtpUploader::displayProgress(qint64 bytesSent, qint64 bytesTotal)
{
    Q_UNUSED(bytesTotal);
    m_progress->setValue(bytesSent);
}



