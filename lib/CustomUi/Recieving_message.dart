import 'package:flutter/material.dart';

class RecievingMessage extends StatelessWidget {
  const RecievingMessage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 80),
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          // color: Color(0xffdcf8c6),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 55, top: 3, left: 8, bottom: 10),
                child: Text(
                  "I'm so tired of killing, I just want to be a kid. Hanging out, doing stuff with Gon. That's it",
                  textAlign: TextAlign.left,
                ),
              ),
              Positioned(
                bottom: 1,
                right: 5,
                child: Row(
                  children: [
                    Text(
                      "22.35",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 9, color: Colors.grey[600]),
                    ),
                    // Icon(Icons.done_all, color: Colors.grey[600],size: 15,),
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
