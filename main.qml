import QtQuick 2.2
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.1
import QtQuick.Controls 1.2
import QtWebKit 3.0
import "qml"

ApplicationWindow {
    visible: true
    width: 1000
    height: 1000

    ColumnLayout {
        id: layoutLMain;
        anchors.fill: parent
        width: parent.width
        height: parent.height

        RowLayout {
            id: layoutR
            Layout.minimumWidth: 50
            Layout.preferredWidth: 100
            Layout.maximumWidth: 300
            //Layout.minimumHeight: 100
            anchors.fill: parent

            TextField {id: textField; placeholderText: "..."; Layout.fillWidth: true; z: 1 ; width: parent.width}

            Button { text: "Go";
                isDefault: true;
                width: parent.width;
                anchors.left: textField.right;
                onClicked: {
                    console.log("send signal emitted with notice");
                }
            }

        }

        WebView  {
            id: webview
            url: "http://www.yandex.ru"
            width: 900
            height: 900
            scale: 0.9
            smooth: false
        }
    }
}

