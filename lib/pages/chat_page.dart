import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUi/Custom_card.dart';
import 'package:whatsapp_clone/CustomUi/chat_model.dart';

// print(filter(zip(list)))
//

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chatmodel = [
    ChatModel(
        name: "Killua Zoldyk",
        icon: "persn.svg",
        time: "20:05",
        currentMessage: "Tired Of Killing",
        isagroup: false),
    ChatModel(
        name: "Gon Freecss",
        icon: "persn.svg",
        time: "21:30",
        currentMessage:
            "it doesn't matter anymre",
        isagroup: false),
    ChatModel(
        name: "Phantom Troup",
        icon: "groups.svg",
        time: "1:45",
        currentMessage: "kurapika killed someone",
        isagroup: true),
    ChatModel(
        name: "Netero Isaac",
        icon: "persn.svg",
        time: "6:01",
        currentMessage: "Goodbye.",
        isagroup: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat),
        onPressed: () {},
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => CustomCard(
          chatModel: chatmodel[index],
        ),
        itemCount: chatmodel.length,
      ),
    );
  }
}
