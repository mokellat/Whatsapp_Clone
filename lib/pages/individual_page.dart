import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/CustomUi/Recieving_message.dart';
import 'package:whatsapp_clone/CustomUi/chat_model.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:whatsapp_clone/CustomUi/sending_message.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key key, this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  TextEditingController _controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  // @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset( 'assets/background6.jpg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leadingWidth: 70,
            titleSpacing: 0.0,
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back)),
                CircleAvatar(
                  backgroundColor: Colors.blueGrey[100],
                  child: SvgPicture.asset(
                    widget.chatModel.isagroup
                        ? "assets/groups.svg"
                        : "assets/person.svg",
                    color: Colors.white,
                    alignment: Alignment.bottomCenter,
                    width: 25,
                    height: 25,
                  ),
                  radius: 18,
                ),
              ],
            ),
            title: InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chatModel.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "Online",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
              IconButton(icon: Icon(Icons.phone), onPressed: () {}),
              PopupMenuButton<String>(onSelected: (value) {
                print(value);
              }, itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("View contact"),
                    value: "View contact",
                  ),
                  PopupMenuItem(
                    child: Text("Media, links, and contacts"),
                    value: "Media Links Contacts",
                  ),
                  PopupMenuItem(
                    child: Text("Search"),
                    value: "Search",
                  ),
                  PopupMenuItem(
                    child: Text("Mute notifications"),
                    value: "Mute Notifications",
                  ),
                  PopupMenuItem(
                    child: Text("Wallpaper"),
                    value: "Walppaper",
                  ),
                  PopupMenuItem(
                    child: Text("More"),
                    value: "More",
                  ),
                ];
              })
            ],
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: WillPopScope(
              child: Stack(  
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 140,
                    child: ListView(children: [
                      SendingMessage(),
                      RecievingMessage(),
                      SendingMessage(),
                      RecievingMessage(),
                      SendingMessage(),
                      RecievingMessage(),
                      SendingMessage(),
                      RecievingMessage(),
                      SendingMessage(),
                      RecievingMessage(),
                      SendingMessage(),
                      RecievingMessage(),
                      SendingMessage(),
                      RecievingMessage(),
                    ],),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 55,
                              child: Card(
                                margin: EdgeInsets.only(
                                    left: 3, right: 3, bottom: 8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: Container(
                                  child: TextFormField(
                                    controller: _controller,
                                    focusNode: focusNode,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type a message",
                                      prefixIcon: IconButton(
                                        icon:
                                            Icon(Icons.emoji_emotions_outlined),
                                        onPressed: () {
                                          focusNode.unfocus();
                                          focusNode.canRequestFocus = false;
                                          setState(() {
                                            show = !show;
                                          });
                                        },
                                      ),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.attach_file),
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) =>
                                                      bottomSheet());
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.camera),
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                      contentPadding: EdgeInsets.all(5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                                child: CircleAvatar(
                                  radius: 23,
                                  backgroundColor: Colors.teal[700],
                                  child: Icon(
                                    Icons.mic,
                                    color: Colors.white,
                                  ),
                                ),
                                padding: EdgeInsets.only(
                                    left: 3, right: 2, bottom: 8)),
                          ],
                        ),
                        show ? emojSelect() : Container(),
                      ],
                    ),
                  ),
                ],
              ),
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.only(left: 13, right: 13, bottom: 63),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(
                      string: "Document",
                      color: Colors.deepPurple[700],
                      icons: Icons.insert_drive_file),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(
                      string: "Camera",
                      color: Colors.pink[700],
                      icons: Icons.camera),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(
                      string: "Gallery",
                      color: Colors.purple,
                      icons: Icons.image),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(
                      string: "Audio",
                      color: Colors.orange[700],
                      icons: Icons.headset),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(
                      string: "Room",
                      color: Colors.indigo,
                      icons: Icons.videocam_rounded),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(
                      string: "Location",
                      color: Colors.teal[800],
                      icons: Icons.room),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                  ),
                  iconcreation(
                      string: "Contact",
                      color: Colors.blue,
                      icons: Icons.person),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconcreation({String string, Color color, IconData icons}) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: CircleAvatar(
            backgroundColor: color,
            radius: 28,
            child: Icon(
              icons,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(string),
      ],
    );
  }

  Widget emojSelect() {
    return EmojiPicker(
      columns: 8,
      rows: 4,
      onEmojiSelected: (emoji, category) {
        setState(() {
          _controller.text += emoji.emoji;
        });
      },
    );
  }
}
