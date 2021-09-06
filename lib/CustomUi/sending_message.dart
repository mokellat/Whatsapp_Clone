import 'package:flutter/material.dart';

class SendingMessage extends StatelessWidget {
  const SendingMessage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 60),
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: Color(0xffdcf8c6),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 55, top: 3, left: 8, bottom: 10),
                child: Text(
                  "heyy",
                  textAlign: TextAlign.left,
                ),
              ),
              Positioned(
                bottom: 1,
                right: 5,
                child: Row(
                  children: [
                    Text(
                      "22.30",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 9, color: Colors.grey[600]),
                    ),
                    Icon(Icons.done_all, color: Colors.grey[600],size: 15,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
