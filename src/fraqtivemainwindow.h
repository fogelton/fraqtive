/**************************************************************************
* This file is part of the Fraqtive program
* Copyright (C) 2004-2012 Michał Męciński
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
**************************************************************************/

#ifndef FRAQTIVEMAINWINDOW_H
#define FRAQTIVEMAINWINDOW_H

#include <QMainWindow>
#include <QFileDialog>
#include <QTimer>
#include "ui_fraqtivemainwindow.h"
#include "xmlui/client.h"
#include "QLogger.h"
//#include "smtpclient.h"
#include "ftpuploader.h"
#include "printimagedialog.h"
class FractalModel;
class Gradient;

class FraqtiveMainWindow : public QMainWindow, public XmlUi::Client
{
    Q_OBJECT
public:
    FraqtiveMainWindow();
    ~FraqtiveMainWindow();

public: // overrides
    bool eventFilter( QObject* watched, QEvent* e );
public slots:
    void fullScreen();
    void processFractal(int id);
signals:
    void finished();
protected: // overrides
    void closeEvent( QCloseEvent* e );

private slots:
    void reverseGradient();
    void nextBookmark();
    void previousBookmark();
    // void sendEmail(bool b);
    // void mailSent(bool b);
    void checkEmptyFractal();
    void fractalType();
    void editGradient();

    void navigateBack();
    void navigateForward();
    void defaultPosition();
    void loadPreset();
    void savePreset();
    void loadBookmark();
    void saveBookmark();
    void saveImage();
    void copyImage();
    void generateImage();
    void generateSeries();
    void view2d();
    void view3d();

    void customContextMenuRequested( const QPoint& pos );

    void positionChanged();
    void navigationChanged();

    void applyGradient( const Gradient& gradient );

private:
    QString getEmailSubject(QString path);
    QString getEmailText(QString url, QString path);
    QString generateImageName(int id);

    bool isFullScreenMode() const;
    void enterFullScreenMode();
    void leaveFullScreenMode();

    QString getSaveFileName( const QString& title, const QString& fileName, QByteArray* selectedFormat, QFileDialog::Options options = 0 );
    QString getSaveImageName( QByteArray* selectedFormat );
    QString getSaveSeriesName( QByteArray* selectedFormat );

    QImageWriter* createImageWriter( const QString& fileName, const QByteArray& format );

    QImage currentImage();

private:
    QTimer m_timer_emptyFrameChecker;
    QLogger::QLoggerManager *m_log_manager;

    QString m_fileName,m_urlFileName;
    QString m_ftp_username;
    QString m_ftp_password;
    int m_ftp_port;
    QString m_ftp_server;
    int m_bookmarkID=0;
    bool m_isPreviousFractalEmpty=false;


    bool m_isPreviousPrintDone=true;
    Ui::FraqtiveMainWindow m_ui;

    FractalModel* m_model;
};

#endif
