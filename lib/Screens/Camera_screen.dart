import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/pages/CameraViewer.dart';
import 'package:whatsapp_clone/pages/VideoViewer.dart';

List<CameraDescription> cameras;
bool flash = false;
// XFile videopathAssign;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key key}) : super(key: key);
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController _cameraController;
  Future<void> cameravalue;
  bool isRecording = false;
  bool camerafront = true;
  double rotate = 0;
  // File videopath;
  XFile videopath;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(
      cameras[0],
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );
    cameravalue = _cameraController.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameravalue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the Future is complete, display the preview.
                  return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: CameraPreview(_cameraController));
                } else {
                  // Otherwise, display a loading indicator.
                  return const Center(child: CircularProgressIndicator());
                }
              }),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(bottom: 5),
              // height: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            flash = !flash;
                          });
                          if (flash == true)
                            _cameraController.setFlashMode(FlashMode.always);
                          else
                            _cameraController.setFlashMode(FlashMode.off);
                        },
                        icon: flash == false
                            ? Icon(
                                Icons.flash_off,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.flash_on,
                                color: Colors.white,
                              ),
                      ),
                      GestureDetector(
                        onLongPress: () async {
                          if (!_cameraController.value.isRecordingVideo)
                            await _cameraController.startVideoRecording();
                          setState(() {
                            isRecording = true;
                          });
                        },
                        onLongPressUp: () async {
                          XFile path =
                              await _cameraController.stopVideoRecording();
                          // print(videopath);
                          setState(() {
                            isRecording = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => VideoViewer(
                                        path: path.path,
                                      )));
                        },
                        onTap: () {
                          if (!isRecording) cameraviewer(context);
                        },
                        child: isRecording
                            ? Icon(
                                Icons.radio_button_on,
                                size: 60,
                                color: Colors.red,
                              )
                            : SvgPicture.asset(
                                "assets/dry-clean.svg",
                                color: Colors.white,
                                width: 55,
                                height: 55,
                              ),
                      ),
                      IconButton(
                        icon: Transform.rotate(
                          angle: rotate,
                          child: Icon(
                            Icons.cameraswitch,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          int cameraPosition = camerafront ? 0 : 1;
                          setState(() {
                            camerafront = !camerafront;
                            rotate += pi;
                          });
                          _cameraController = CameraController(
                            cameras[cameraPosition],
                            ResolutionPreset.medium,
                            imageFormatGroup: ImageFormatGroup.yuv420,
                          );
                          cameravalue = _cameraController.initialize();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Hold for video, tap for photo",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void cameraviewer(BuildContext context) async {
    // final path =
    //     join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
    XFile imagepath = await _cameraController.takePicture();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => CameraViewer(
                  path: imagepath.path,
                )));
  }
}
