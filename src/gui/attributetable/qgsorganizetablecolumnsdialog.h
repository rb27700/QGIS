/***************************************************************************
  qgsorganizetablecolumnsdialog.h - dialog for attribute table
  -------------------
         date                 : Feb 2016
         copyright            : Stéphane Brunner
         email                : stephane.brunner@gmail.com

 ***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#ifndef QGSORGANIZEFILTERTABLESDIALOG_H_
#define QGSORGANIZEFILTERTABLESDIALOG_H_

#include <QDialog>

#include "ui_qgsorganizetablecolumnsdialog.h"

class QgsVectorLayer;

class GUI_EXPORT QgsOrganizeTableColumnsDialog : public QDialog, private Ui::QgsOrganizeTableColumnsDialog
{
    Q_OBJECT

  public:
    /**
     * Constructor
     * @param vl The concerned vector layer
     * @param visible the current list of visible fields name
     * @param parent parent object
     * @param flags window flags
     */
    QgsOrganizeTableColumnsDialog( const QgsVectorLayer* vl, QStringList visible, QWidget *parent = nullptr, Qt::WindowFlags flags = Qt::Window );
    /**
     * Destructor
     */
    ~QgsOrganizeTableColumnsDialog();

    /**
     * Get the selected fields name
     * @return The selected fields name
     */
    QStringList selectedFields() const;
};

#endif