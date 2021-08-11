import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUi/chat_model.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({Key key, this.contact, this.icon}) : super(key: key);
  final ChatModel contact;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: Colors.greenAccent[400],
            child: IconButton(
              alignment: Alignment.topLeft,
              onPressed: () {},
              icon: icon,
              color: Colors.white,
            )),
        title: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              contact.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
