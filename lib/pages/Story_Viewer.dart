import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryViewer extends StatefulWidget {
  const StoryViewer({Key key}) : super(key: key);

  @override
  _StoryViewerState createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer> {
  @override
  Widget build(BuildContext context) {
    final controller = StoryController();
    List<StoryItem> storyItems = [
      // StoryItem.text(title: "", backgroundColor: Colors.grey),
      StoryItem.pageImage(
          url:
              "https://static1.cbrimages.com/wordpress/wp-content/uploads/2021/01/Featured-Image-Gon-Freecss-Cropped.jpg",
          controller: controller), //add a url from network
      // StoryItem.pageImage(),
      // StoryItem.pageVideo(

      //   controller: controller,
      // )
    ];
    return StoryView(
        storyItems: storyItems,
        controller: controller, // pass controller here too
        repeat: false, // should the stories be slid forever
        // onStoryShow: (s) {notifyServer(s)},
        onComplete: () {
          Navigator.pop(context);
        },
        onVerticalSwipeComplete: (direction) {
          if (direction == Direction.down) {
            Navigator.pop(context);
          }
        } // To disable vertical swipe gestures, ignore this parameter.
        // Preferrably for inline story view.
        );
  }
}
