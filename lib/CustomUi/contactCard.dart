import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/CustomUi/chat_model.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key key, this.contact}) : super(key: key);
  final ChatModel contact;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          child: Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueGrey[100],
                child: SvgPicture.asset(
                  "assets/person.svg",
                  color: Colors.white,
                  alignment: Alignment.bottomCenter,
                  width: 30,
                  height: 30,
                ),
              ),
              (contact.groupcheck)
                  ? Positioned(
                      right: 5,
                      bottom: 4,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.teal,
                        child: Icon(
                          Icons.check,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contact.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              contact.status,
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
