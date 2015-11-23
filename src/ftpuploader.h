/*
 * Copyright (c) 2015 Andrej Fogelton

adjusted the work from internet
*/
#ifndef FTPUPLOADER_H
#define FTPUPLOADER_H

#include <QObject>
#include <QFileInfo>
#include <QDate>
#include <QUrl>
#include <QFile>
#include <QDebug>
#include <QThread>
#include <QEventLoop>
#include <QCoreApplication>
#include <QWidget>
#include "QLogger.h"
#include <QProgressDialog>
#include <QNetworkAccessManager>
#include <QNetworkReply>
class FtpUploader:public QWidget
{
    Q_OBJECT
public:
    FtpUploader(QString username,QString password,QString server,int port=21,QWidget *p=0);
    ~FtpUploader();
    void uploadFile(const QString fileName, const QString &urlFileName) ;
signals:
    void uploadSucess(bool);

private slots:
       void displayProgress(qint64 bytesSent, qint64 bytesTotal);

   private:
       bool m_uploadFinished;
       QProgressDialog *m_progress;
       QNetworkAccessManager m_nam;
       QFile *m_data;
       QNetworkReply *m_reply;
       QLogger::QLoggerManager *m_log_manager;
       QString m_username;
       QString m_password;
       int m_port;
       QString m_server;
};

#endif // FTPUPLOADER_H
