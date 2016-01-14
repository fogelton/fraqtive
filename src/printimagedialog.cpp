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

#include "printimagedialog.h"

#include <QDesktopWidget>

#include "fraqtiveapplication.h"
#include "configurationdata.h"
#include "datafunctions.h"
#include "iconloader.h"

PrintImageDialog::PrintImageDialog( QWidget* parent ) : QDialog( parent ),
    m_multiSampling( 0 )
{
    m_ui.setupUi( this );

    m_ui.promptPixmap->setPixmap( IconLoader::pixmap( "generate-image", 22 ) );
    m_ui.promptLabel->setText( tr( "Generate an image of the fractal:" ) );

    m_ui.promptLabel->setMinimumWidth( 350 );
    m_ui.promptLabel->setFixedHeight( m_ui.promptLabel->heightForWidth( 350 ) );

    setFixedHeight( sizeHint().height() );

    m_ui.own_radioButton->setChecked(true);

    m_ui.spinWidth->setValue( 1920 );
    m_ui.spinHeight->setValue( 1080 );

    int width, height;
    if ( QSysInfo::WordSize == 64 ) {
        width = 30720;
        height = 17280;
    } else {
        width = 8000;
        height = 8000;
    }

    m_ui.spinWidth->setMaximum( width  );
    m_ui.spinHeight->setMaximum( height );

}

PrintImageDialog::~PrintImageDialog()
{
}

int PrintImageDialog::findTheBestSampling(QSize resolution)
{
    int multiSampling=0;

    int maxWidth, maxHeight;
    if ( QSysInfo::WordSize == 64 ) {
        maxWidth = 30720;
        maxHeight = 17280;
    } else {
        maxWidth = 8000;
        maxHeight = 8000;
    }

    if(((maxWidth>>1) >= resolution.width())&&((maxHeight>>1) >= resolution.height()))
    {
        multiSampling++;

    }
    else
        return multiSampling;

    if(((maxWidth>>2) >= resolution.width())&&((maxHeight>>2) >= resolution.height()))
    {
        multiSampling++;

    }
    else
        return multiSampling;

    if(((maxWidth>>3) >= resolution.width())&&((maxHeight>>3) >= resolution.height()))
    {
        multiSampling++;

    }
    else
        return multiSampling;

    return multiSampling;
}

void PrintImageDialog::accept()
{
    m_resolution = QSize( m_ui.spinWidth->value(), m_ui.spinHeight->value() );
    m_multiSampling = findTheBestSampling(m_resolution);
    qDebug()<<"multisampling: "<<m_multiSampling;
    m_generatorSettings.setCalculationDepth( 4.0 );
    m_generatorSettings.setDetailThreshold( 0.0);
    m_viewSettings.setAntiAliasing( HighAntiAliasing );
    QDialog::accept();
}

void PrintImageDialog::on_own_radioButton_toggled(bool checked)
{
    if(checked)
    {
        m_ui.spinWidth->setValue( 1920 );
        m_ui.spinHeight->setValue( 1080 );
        m_ui.groupBox->setEnabled(true);
    }
    else
    {
        m_ui.groupBox->setDisabled(true);
    }
}

void PrintImageDialog::on_a0_radioButton_toggled(bool checked)
{
    if(checked)
    {
        m_ui.groupBox->setDisabled(true);
        m_ui.spinHeight->setValue(9920);
        m_ui.spinWidth->setValue(14032);
    }
}
void PrintImageDialog::on_a1_radioButton_toggled(bool checked)
{
    if(checked)
    {
        m_ui.groupBox->setDisabled(true);
        m_ui.spinHeight->setValue(7016);
        m_ui.spinWidth->setValue(9920);
    }
}
void PrintImageDialog::on_a2_radioButton_toggled(bool checked)
{
    if(checked)
    {
        m_ui.groupBox->setDisabled(true);
        m_ui.spinHeight->setValue(4960);
        m_ui.spinWidth->setValue(7016);
    }
}
void PrintImageDialog::on_a3_radioButton_toggled(bool checked)
{
    if(checked)
    {
        m_ui.groupBox->setDisabled(true);
        m_ui.spinHeight->setValue(3508);
        m_ui.spinWidth->setValue(4960);
    }
}
void PrintImageDialog::on_a4_radioButton_toggled(bool checked)
{
    if(checked)
    {
        m_ui.groupBox->setDisabled(true);
        m_ui.spinHeight->setValue(2480);
        m_ui.spinWidth->setValue(3508);
    }
}
