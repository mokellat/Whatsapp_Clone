import 'package:flutter/material.dart';
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
        body: ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (contacts[index].groupcheck == false) {
                    setState(() {
                      // print('before');
                      // print(contacts[index].groupcheck);
                      contacts[index].groupcheck = true;
                      // print('after');
                      // print(contacts[index].groupcheck);
                      groups.add(contacts[index]);
                      print('-------------------');
                    });
                  } else {
                    setState(() {
                      // print('before');
                      // print(contacts[index].groupcheck);
                      contacts[index].groupcheck = false;
                      // print('after');
                      // print(contacts[index].groupcheck);
                      groups.remove(contacts[index]);
                      print('-------------------');
                    });
                  }
                },
                child: ContactCard(
                  contact: contacts[index],
                ),
              );
            }));
  }
}
