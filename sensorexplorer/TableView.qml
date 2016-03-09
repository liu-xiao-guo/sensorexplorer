import QtQuick 2.0
import Ubuntu.Components 1.2

Item {
    property alias model:listview.model

    ListView {
        id: listview
        clip: true
        anchors.fill: parent

        delegate: ListItem {
            id: del
            width: listview.width
            height: layout.childrenRect.height + units.gu(1)

            Rectangle {
                anchors.fill: parent
                color: index%2 == 0 ?  "Azure" : "Beige"
            }

            Column {
                id: layout
                width: listview.width
                spacing: units.gu(1)

                Item {
                    width: parent.width
                    height: sensorid.height

                    Label { id: sensorid; x: units.gu(1); text: model.id; fontSize: "large"}
                    Label { id: start; x: del.ListView.view.width/2; text: model.start; fontSize: "large"}

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            explorer.selectedSensorItem = explorer.availableSensors[index];
                            console.log("selectedSensorItem: " + explorer.selectedSensorItem);
                            explorer.selectedSensorItem.start = true;
                            listview1.model = explorer.selectedSensorItem.properties
                            properlist.title = model.id
                            pageStack.push(properlist);
                        }
                    }
                }

            }
        }
    }
}

