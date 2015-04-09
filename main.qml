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
        //        width: parent.width
        //        height: parent.height

        RowLayout {
            id: layoutR
            Layout.minimumWidth: 50
            Layout.preferredWidth: 100
            Layout.maximumWidth: 300
            //Layout.minimumHeight: 100
            //anchors.fill: parent


            TextField {id: textField; placeholderText: "..."; Layout.fillWidth: true; z: 1 ; width: parent.width}

            Button {
                id: button1;
                text: "Go";
                isDefault: true;
                width: parent.width;
                anchors.left: textField.right;

                menu: Menu {
                    MenuItem { text: "Go"; onTriggered: button1.changeUrl();           }
                    MenuItem { text: "Add Favorite"; onTriggered: favoritAddButton.addFavoritePage()  }
                }

                function changeUrl () {
                    var txt;
                    var buffer;
                    buffer = textField.text.substring(0, 7);
                    if ((buffer === 'http://') || (buffer === 'https:/')) {
                        webview.url = textField.text;
                    } else {
                        txt = 'http://'+textField.text;
                        webview.url = txt;
                    }
                    webview.update();
                    return;
                }
            }

            Button {
                id: favoritAddButton;
                text: "Add start page"
                isDefault: true;
                anchors.left: button1.right;

                function addFavoritePage () {
                    favButton.text = webview.url;
                }

                onClicked: {
                    addFavoritePage();
                }

            }

        }
        RowLayout {
            id:layoutCenter
            anchors.top: layoutR.bottom
            anchors.bottom: layoutFooter.top


            WebView  {
                id: webview
                url: "http://www.yandex.ru"
                anchors.fill: parent
            }
        }
        RowLayout {
            id: layoutFooter
            Layout.minimumWidth: 50
            Layout.preferredWidth: 100
            Layout.maximumWidth: 300
            //Layout.minimumHeight: 100
            //anchors.top: webview.bottom


            Button {
                id:favButton
                text: ""

                function openFavoritePage () {
                    webview.url = favButton.text;
                    webview.update();
                }

                onClicked: {
                    openFavoritePage();
                }

            }
        }
    }
}

