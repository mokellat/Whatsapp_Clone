import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/CustomUi/chat_model.dart';
import 'package:whatsapp_clone/pages/individual_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key key, this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => IndividualPage(chatModel: chatModel,)));
      },
      child: Column(
        children: [
          ListTile(
              leading: InkWell(
                onTap: (){},
                child: CircleAvatar(
                  backgroundColor: Colors.blueGrey[100],
                  child: SvgPicture.asset(
                    chatModel.isagroup
                        ? "assets/groups.svg"
                        : "assets/person.svg",
                    color: Colors.white,
                    alignment: Alignment.bottomCenter,
                    width: 40,
                    height: 40,
                  ),
                  radius: 28,
                ),
              ),
              trailing: Text(chatModel.time),
              title: Text(
                chatModel.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.done_all,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    chatModel.currentMessage,
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              )),
          Divider(
            thickness: 1,
            indent: 90,
          ),
        ],
      ),
    );
  }
}
