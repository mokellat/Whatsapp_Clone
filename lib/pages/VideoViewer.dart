import 'package:flutter/material.dart';
import 'dart:io';
import 'package:video_player/video_player.dart';

class VideoViewer extends StatefulWidget {
  const VideoViewer({Key key, this.path}) : super(key: key);
  final String path;

  @override
  _VideoViewerState createState() => _VideoViewerState();
}

class _VideoViewerState extends State<VideoViewer> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = _controller = VideoPlayerController.file(File(widget.path));
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {});
    });
  }

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
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Container(),
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
                  ),
                ],
              ),
              Center(
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blueGrey[300],
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        // If the video is playing, pause it.
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                          print(0);
                        } else {
                          // If the video is paused, play it.
                          _controller.play();
                          print(1);
                        }
                      });
                    },
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    super.dispose();
  }
}
