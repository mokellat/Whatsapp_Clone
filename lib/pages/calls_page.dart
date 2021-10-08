import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUi/CallModel.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({Key key}) : super(key: key);

  @override
  _CallsPageState createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Positioned(
          bottom: 10,
          right: 15,
          child: CircleAvatar(
            backgroundColor: Colors.teal,
            radius: 25,
            child: Icon(
              Icons.add_ic_call_sharp,
              color: Colors.white,
            ),
          ),
        ),
        ListView(
          children: [
            CallModel(
              name: "Killua Zoldyk",
              image: "assets/person.svg",
              text: "October 5, 20:22",
              icon: Icons.call,
            ),
            CallModel(
              name: "Gon Freecss",
              image: "assets/person.svg",
              text: "Yesterday, 21:45",
              icon: Icons.videocam,
            ),
            CallModel(
              name: "Netero Isaac",
              image: "assets/person.svg",
              text: "2/6/2011, 00:00",
              icon: Icons.call,
            ),
            CallModel(
              name: "Killua Zoldyk",
              image: "assets/person.svg",
              text: "October 5, 20:22",
              icon: Icons.call,
            ),
            CallModel(
              name: "Gon Freecss",
              image: "assets/person.svg",
              text: "Yesterday, 21:45",
              icon: Icons.videocam,
            ),
            CallModel(
              name: "Netero Isaac",
              image: "assets/person.svg",
              text: "2/6/2011, 00:00",
              icon: Icons.call,
            ),
            CallModel(
              name: "Killua Zoldyk",
              image: "assets/person.svg",
              text: "October 5, 20:22",
              icon: Icons.call,
            ),
            CallModel(
              name: "Gon Freecss",
              image: "assets/person.svg",
              text: "Yesterday, 21:45",
              icon: Icons.videocam,
            ),
            CallModel(
              name: "Netero Isaac",
              image: "assets/person.svg",
              text: "2/6/2011, 00:00",
              icon: Icons.call,
            ),
            CallModel(
              name: "Killua Zoldyk",
              image: "assets/person.svg",
              text: "October 5, 20:22",
              icon: Icons.call,
            ),
            CallModel(
              name: "Gon Freecss",
              image: "assets/person.svg",
              text: "Yesterday, 21:45",
              icon: Icons.videocam,
            ),
            CallModel(
              name: "Netero Isaac",
              image: "assets/person.svg",
              text: "2/6/2011, 00:00",
              icon: Icons.call,
            ),
          ],
        ),
      ]),
    );
  }
}
