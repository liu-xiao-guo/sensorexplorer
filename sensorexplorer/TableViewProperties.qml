import QtQuick 2.0
import Ubuntu.Components 1.2

ListView {
    clip: true

    delegate: ListItem {
        id: del1
        width: listview1.width
        height: layout1.childrenRect.height + units.gu(1)

        Rectangle {
            anchors.fill: parent
            color: index%2 == 0 ?  "Azure" : "Beige"
        }

        Column {
            id: layout1
            width: listview1.width
            spacing: units.gu(1)

            Item {
                width: parent.width
                height: name2.height

                Label { id: name2; x: units.gu(1); text:model.name; fontSize: "large"}
                Label {
                    id: value2
                    x: del1.ListView.view.width/2
                    text: model.value;
                    fontSize: "large"
                    visible: !model.isWriteable
                }
                Loader { // Initialize text editor lazily to improve performance
                    id: loaderEditor
                    x: del1.ListView.view.width/2
                    height:name2.height;
                    visible: model.isWriteable
                    Connections {
                        target: loaderEditor.item
                        onAccepted: {
                            explorer.selectedSensorItem.changePropertyValue(propertyList.selectedItem, loaderEditor.item.text);
                        }
                    }

                    sourceComponent: editor

                    Component {
                        id: editor
                        TextInput {
                            id: textinput
                            text: model.value
                            color:"blue"
                            MouseArea {
                                id: mouseArea
                                anchors.fill: parent
                                hoverEnabled: true
                                onClicked: textinput.forceActiveFocus()
                            }
                        }
                    }
                }
            }
        }
    }
}
