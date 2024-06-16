/*
 * Copyright (C) 2024  Faisal Shahzad
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * pysensors is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Lomiri.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import io.thp.pyotherside 1.4
import QtPositioning 5.11
import QtSensors 5.11

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'pysensors.pybodensee.com'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    Page {
        anchors.fill: parent
        header: PageHeader {
            id: header
            title: i18n.tr('PySensors')
        }

        Rectangle {
            id: comapssRect
            width: parent.width
            height: 100
            border.width: 1
            radius: 5
            color: "#3c3e42"
            anchors {
                top: header.bottom
                left: parent.left
                right: parent.right
            }
        
            visible: compass.connectedToBackend

            Compass {
                id: compass
                active: true
            }
            Label {
                id: compassLabel
                anchors {
                    margins: 20
                    top: comapssRect.top
                    left: parent.left
                    right: parent.right
                }
                text: 'Compass Azimuth: Ready!'
                verticalAlignment: Label.AlignVCenter
            }
        }
        Timer {
            id: compassTimer
            interval: 1
            repeat: true
            running: true
            triggeredOnStart: true
            onTriggered: python.processSensors(compass)
        }
    }

    Python {
        id: python

        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl('../src/'));
            importModule('fusion', function () {});
        }

        function processSensors(parameters) {
            call('fusion.format', [parameters], function(results){
                    compassLabel.text = results;
                });
        }
        onError: {
            console.log('python error: ' + traceback);
        }
    }
}