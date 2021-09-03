import 'package:flutter/material.dart';
import 'dart:io';

class CameraViewer extends StatelessWidget {
  const CameraViewer({Key key, this.path}) : super(key: key);
  final String path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leadingWidth: 70,
          titleSpacing: 0.0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.crop_rotate),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.sentiment_satisfied_alt),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.title),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit_outlined),
            ),
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.file(
                  File(path),
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 60,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        minLines: 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Add a caption...",
                          prefixIcon: IconButton(
                            icon: Icon(Icons.collections),
                            onPressed: () {},
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.looks_one_outlined),
                            onPressed: () {},
                          ),
                          contentPadding: EdgeInsets.all(5),
                        ),
                      ),
                    ),
                  ),
                 CircleAvatar(
                   radius: 23,
                   backgroundColor: Colors.teal[800],
                   child: Icon(Icons.check),
                 )
                ],
              ),
            ],
          ),
        ));
  }
}
