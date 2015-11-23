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

#ifndef PRINTIMAGEDIALOG_H
#define PRINTIMAGEDIALOG_H

#include <QDialog>

#include "ui_printimagedialog.h"
#include "datastructures.h"

class PrintImageDialog : public QDialog
{
    Q_OBJECT
public:
    PrintImageDialog( QWidget* parent );
    ~PrintImageDialog();

public:
    QSize resolution() const { return m_resolution; }
    int multiSampling() const { return m_multiSampling; }
    GeneratorSettings generatorSettings() const { return m_generatorSettings; }
    ViewSettings viewSettings() const { return m_viewSettings; }

public: // overrides
    void accept();

private slots:
    void on_own_radioButton_toggled(bool checked);
    void on_a0_radioButton_toggled(bool checked);
    void on_a1_radioButton_toggled(bool checked);
    void on_a2_radioButton_toggled(bool checked);
    void on_a3_radioButton_toggled(bool checked);
    void on_a4_radioButton_toggled(bool checked);

private:
    int findTheBestSampling(QSize resolution);

private:
    Ui::PrintImageDialog m_ui;

    QSize m_resolution;
    int m_multiSampling;
    GeneratorSettings m_generatorSettings;
    ViewSettings m_viewSettings;
};

#endif
