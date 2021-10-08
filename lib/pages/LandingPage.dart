import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/Screens/Home_Screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var size =  MediaQuery.of(context).size.width / 2;
    return (Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 50),
                child: Text(
                  'Welcome to WhatsApp',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    // letterSpacing: 2
                    // wordSpacing: 5
                  ),
                ),
              ),
              Image.asset(
                "assets/landing_page.png",
                color: Colors.greenAccent[700],
                scale: 2,
              ),
              SizedBox(
                height: 75,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 15, right: 15),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(style: TextStyle(fontSize: 15), children: [
                    TextSpan(
                      text: "Tap 'Agree and Continue' to accept ",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    TextSpan(
                      text: "the WhatsApp Terms of Services and Privacy Policy",
                      style: TextStyle(color: Colors.cyan),
                    ),
                  ]),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 100,
                height: 60,
                // color: Colors.green,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Homescreen()));
                  },
                  child: Card(
                    elevation: 6,
                    color: Colors.greenAccent[700],
                    child: Center(
                        child: Text(
                      "AGREE AND CONTINUE",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
