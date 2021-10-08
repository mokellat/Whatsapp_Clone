import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/Home_Screen.dart';
import 'package:whatsapp_clone/pages/LandingPage.dart';
import 'Screens/Camera_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  // final firstCamera = cameras.first;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF075E54), accentColor: Color(0xFF128C7E)),
      home: LandingPage(),
    );
  }
}
