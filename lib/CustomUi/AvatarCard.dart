import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/CustomUi/chat_model.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({Key key, this.contact}) : super(key: key);
  final ChatModel contact;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
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
              Positioned(
                right: 0,
                bottom: 0,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.remove,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Text(contact.name),
        ],
      ),
    );
  }
}
