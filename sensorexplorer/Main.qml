import QtQuick 2.0
import Ubuntu.Components 1.2
import SensorExplorer 1.0

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "sensorexplorer.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    width: units.gu(60)
    height: units.gu(85)

    SensorExplorer {
        id: explorer
    }

    PageStack {
        id: pageStack
        Component.onCompleted: push(sensorlist)

        Page {
            id: sensorlist
            title: i18n.tr("Sensor explorer")
            visible: false

            Column {
                anchors.fill: parent
                anchors.margins: units.gu(1)
                spacing: units.gu(1)

                Item {
                    id: title
                    width: parent.width
                    height:id1.height*1.1
                    Label { id: id1; x: units.gu(1); text: "ID"; font.bold: true }
                    Label { id: running; x: parent.width/2; text: "Running"; font.bold: true }
                }

                TableView {
                    id: sensors
                    width: parent.width
                    height: parent.height - title.height
                    model: explorer.availableSensors
                }
            }
        }

        Page {
            title: "properties"
            id: properlist
            visible: false

            Column {
                anchors.fill: parent
                anchors.margins: units.gu(1)
                spacing: units.gu(1)

                Item {
                    id: title1
                    width: parent.width
                    height:name1.height*1.1
                    Label { id: name1; x: units.gu(1); text: "name"; font.bold: true }
                    Label { id: value1; x: parent.width/2; text: "value"; font.bold: true }
                }

                TableViewProperties {
                    id: listview1
                    width: parent.width
                    height: parent.height - title1.height
                }
            }
        }
    }
}
