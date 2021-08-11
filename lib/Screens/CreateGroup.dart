import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUi/AvatarCard.dart';
import 'package:whatsapp_clone/CustomUi/chat_model.dart';
import 'package:whatsapp_clone/CustomUi/contactCard.dart';

class CreateGroup extends StatefulWidget {
  CreateGroup({Key key}) : super(key: key);
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> groups = [];
  final List<ChatModel> contacts = [
    ChatModel(
      name: "Killua Zoldyk",
      status: "failed first hunter exam !",
    ),
    ChatModel(
      name: "Gon Freecss",
      status: "I'm a designer cause my name is free css ",
    ),
    ChatModel(
      name: "Kurapika",
      status: "0.01% left",
    ),
    ChatModel(
      name: "Netero Isaac",
      status: "Unavailable",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New group",
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "Add participants",
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
              ],
            ),
            PopupMenuButton<String>(onSelected: (value) {
              print(value);
            }, itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("Invite a friend"),
                  value: "Invite a friend",
                ),
                PopupMenuItem(child: Text("Contacts"), value: "Contacts"),
                PopupMenuItem(
                  child: Text("Refresh"),
                  value: "Refresh",
                ),
                PopupMenuItem(
                  child: Text("Help"),
                  value: "Help",
                ),
              ];
            })
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return (Container(
                      height: groups.length > 0 ? 90 : 10,
                    ));
                  }
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (contacts[index - 1].groupcheck == true) {
                          groups.remove(contacts[index - 1]);
                          contacts[index - 1].groupcheck = false;
                        }
                        else
                        {
                          groups.add(contacts[index - 1]);
                          contacts[index - 1].groupcheck = true;
                        }
                      });
                    },
                    child: ContactCard(
                      contact: contacts[index - 1],
                    ),
                  );
                }),
            (groups.length > 0)
                ? Column(
                    children: [
                      Container(
                        height: 75,
                        color: Colors.white,
                        child: ListView.builder(
                          itemCount: contacts.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            if (contacts[index].groupcheck == true) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    groups.remove(contacts[index]);
                                    contacts[index].groupcheck = false;
                                  });
                                },
                                child: (AvatarCard(
                                  contact: contacts[index],
                                )),
                              );
                            } else {
                              return (Container());
                            }
                          },
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                    ],
                  )
                : Container(),
          ],
        ));
  }
}
