import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUi/buttonCard.dart';
import 'package:whatsapp_clone/CustomUi/chat_model.dart';
import 'package:whatsapp_clone/CustomUi/contactCard.dart';
import 'package:whatsapp_clone/Screens/CreateGroup.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key key, this.contact}) : super(key: key);
  final ChatModel contact;

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    final List<ChatModel> contacts = [
      ChatModel(
        name: "New group",
      ),
      ChatModel(
        name: "New contact",
      ),
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
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select contact",
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              (contacts.length - 2).toString() + " contacts",
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
                child: Text("Refreash"),
                value: "Refreash",
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
        itemBuilder: (context, index) => (index < 2)
            ? InkWell(
                onTap: () {
                  if (index == 0) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => CreateGroup()));
                  }
                },
                child: ButtonCard(
                  contact: contacts[index],
                  icon:
                      (index == 0) ? Icon(Icons.group) : Icon(Icons.person_add),
                ),
              )
            : ContactCard(
                contact: contacts[index],
              ),
      ),
    );
  }
}
