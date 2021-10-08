import 'dart:math';

import 'package:flutter/material.dart';

class StatusViewed extends StatefulWidget {
  const StatusViewed(
      {Key key, this.image, this.name, this.time, this.statusNum})
      : super(key: key);
  final image;
  final name;
  final time;
  final statusNum;

  @override
  _StatusViewedState createState() => _StatusViewedState();
}

class _StatusViewedState extends State<StatusViewed> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CustomPaint(
              painter: InheritPaint(
                  color: Colors.teal,
                  color1: Colors.white,
                  numStatus: widget.statusNum),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(widget.image),
                radius: 27,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                widget.time,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class InheritPaint extends CustomPainter {
  const InheritPaint({Key key, this.color, this.color1, this.numStatus});
  final color;
  final color1;
  final numStatus;
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..color = color
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke;
    final Paint paint1 = Paint()
      ..isAntiAlias = true
      ..color = color1
      ..strokeWidth = 5.0 
      ..style = PaintingStyle.stroke;
    drawArc(paint, canvas, size);
    drawArcWhite(paint1, canvas, size);
  }

  void drawArcWhite(Paint paint, Canvas canvas, Size size) {
    canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height), 0, 2 * pi,
        false, paint);
  }

  void drawArc(Paint paint, Canvas canvas, Size size) {
    if (numStatus == 1) {
      canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height), 0,
          2 * pi, false, paint);
    } else {
      double degreeStart = 0;
      double plus = 360 / numStatus;
      for (int i = 0; i < numStatus; i++) {
        canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
            (degreeStart + 4) * pi / 180, (plus - 8) * pi / 180, false, paint);
        degreeStart += plus;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
