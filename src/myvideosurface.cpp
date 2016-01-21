#include "myvideosurface.h"
#include <QImage>
MyVideoSurface::MyVideoSurface(QWidget* widget, VideoIF* target, QObject* parent)
    : QAbstractVideoSurface(parent)
{
    m_targetWidget = widget;
    m_target = target;
    m_imageFormat = QImage::Format_Invalid;


}

MyVideoSurface::~MyVideoSurface()
{
}

bool MyVideoSurface::start(const QVideoSurfaceFormat &format)
{
    m_videoFormat = format;
    const QImage::Format imageFormat = QVideoFrame::imageFormatFromPixelFormat(format.pixelFormat());
    const QSize size = format.frameSize();

    if (imageFormat != QImage::Format_Invalid && !size.isEmpty()) {
        m_imageFormat = imageFormat;
        QAbstractVideoSurface::start(format);
        return true;
    } else {
        return false;
    }
}
void MyVideoSurface::sendImageToDecode()
{
    if (m_frame.map(QAbstractVideoBuffer::ReadOnly)) {

        QImage image(
                    m_frame.bits(),
                    m_frame.width(),
                    m_frame.height(),
                    m_frame.bytesPerLine(),
                    m_imageFormat);

        if (!image.isNull())
            emit imageCaptured(image);

        m_frame.unmap();
    }
}
bool MyVideoSurface::present(const QVideoFrame &frame)
{
    m_frame = frame;
    if (surfaceFormat().pixelFormat() != m_frame.pixelFormat() ||
            surfaceFormat().frameSize() != m_frame.size()) {
        stop();
        return false;
    } else {
        m_target->updateVideo();
        return true;
    }
}

void MyVideoSurface::paint(QPainter *painter)
{
    if (m_frame.map(QAbstractVideoBuffer::ReadOnly)) {
        QImage image(
                    m_frame.bits(),
                    m_frame.width(),
                    m_frame.height(),
                    m_frame.bytesPerLine(),
                    m_imageFormat);

        QRect r = m_targetWidget->rect();
        QPoint centerPic((qAbs(r.size().width() - image.size().width())) / 2, (qAbs(
                                                                                   r.size().height() - image.size().height())) / 2);

        if (!image.isNull()) {

            painter->scale(1,-1);
            painter->translate(0,-image.height()-100);//image.width(),image.height());
            painter->drawImage(centerPic,image);
        }

        m_frame.unmap();
    }
}

QList<QVideoFrame::PixelFormat> MyVideoSurface::supportedPixelFormats(
        QAbstractVideoBuffer::HandleType handleType) const
{
    if (handleType == QAbstractVideoBuffer::NoHandle) {
        return QList<QVideoFrame::PixelFormat>()
                << QVideoFrame::Format_UYVY
                << QVideoFrame::Format_RGB32
                << QVideoFrame::Format_ARGB32
                << QVideoFrame::Format_ARGB32_Premultiplied
                << QVideoFrame::Format_RGB565
                << QVideoFrame::Format_RGB555;
    } else {
        return QList<QVideoFrame::PixelFormat>();
    }
}




