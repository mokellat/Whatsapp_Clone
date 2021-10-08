import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:whatsapp_clone/CustomUi/status_viewed.dart';
import 'package:whatsapp_clone/Screens/Camera_screen.dart';
import 'package:whatsapp_clone/pages/CameraViewer.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 11,
            child: InkWell(
              onTap: () {
                
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CameraScreen()));
              },
              child: CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 28,
                child: Icon(
                  Icons.camera,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 90,
            right: 14,
            child: CircleAvatar(
              backgroundColor: Colors.blueGrey[100],
              child: Icon(
                Icons.edit,
                color: Colors.black,
              ),
              radius: 25,
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, left: 8, bottom: 8, right: 18),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            'https://pbs.twimg.com/profile_images/1316430217561464835/sPwkKt63.jpg',
                          ),
                          // child: ,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 2,
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.teal,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "My status",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Tap to add status update",
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
              Container(
                color: Colors.grey[350],
                alignment: Alignment.centerLeft,
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Viewed updates",
                    style: TextStyle(color: Colors.grey[900], fontSize: 16),
                  ),
                ),
              ),
              Container(
                // color: Colors.blue,
                height: MediaQuery.of(context).size.height - 270,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: [
                    StatusViewed(
                      image: 'assets/gon.jfif',
                      name: 'Gon Freecss',
                      time: 'Today, 13:00',
                      statusNum: 1,
                    ),
                    StatusViewed(
                      image: 'assets/troup.jpg',
                      name: 'Phantom troup',
                      time: 'Today, 17:00',
                      statusNum: 3,
                    ),
                    StatusViewed(
                      image: 'assets/netero1.jpg',
                      name: 'Netero Isaac',
                      time: 'Yesterday, 11:00',
                      statusNum: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
