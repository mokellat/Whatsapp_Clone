import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CallModel extends StatefulWidget {
  const CallModel({Key key, this.image, this.name, this.text, this.icon})
      : super(key: key);
  final image;
  final name;
  final text;
  final icon;
  @override
  _CallModelState createState() => _CallModelState();
}

class _CallModelState extends State<CallModel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 8, right: 10, bottom: 15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 19,
              // backgroundImage: AssetImage(widget.image),
              backgroundColor: Colors.blueGrey[100],
              child: SvgPicture.asset(
                widget.image,
                color: Colors.white,
                width: 30,
                height: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.text,
                  style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   width: 200,
          // ),
          Icon(
            widget.icon,
            color: Colors.teal,
          )
        ],
      ),
    );
  }
}
