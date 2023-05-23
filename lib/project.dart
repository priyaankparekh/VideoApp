import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

import 'Theme/app_colors.dart';
import 'contact.dart';

class Project extends StatefulWidget {
  const Project({Key? key}) : super(key: key);

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  // https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4
  // https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4

  String lorem =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Risus sed vulputate odio ut enim. Ultrices in iaculis nunc sed augue lacus viverra vitae. Amet mattis vulputate enim nulla aliquet porttitor lacus luctus. Lacus luctus accumsan tortor posuere ac ut consequat semper. Dolor morbi non arcu risus quis varius. Pretium nibh ipsum consequat nisl vel pretium lectus. Nibh mauris cursus mattis molestie a iaculis at erat pellentesque. Hendrerit gravida rutrum quisque non tellus orci ac auctor. Sit amet consectetur adipiscing elit duis tristique sollicitudin nibh.";

  late VideoPlayerController _videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  String videoUrl =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.network(videoUrl)
      ..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        // elevation: 0.,
        backgroundColor: AppColors.primary,
        title: Text("VideoVerse"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: _videoPlayerController.value.isInitialized
                          ? CustomVideoPlayer(
                              customVideoPlayerController:
                                  _customVideoPlayerController,
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 16.0,
                ),
                Text(
                  "Butterfly CloseUp Video",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 16.0,
                ),
                CircleAvatar(
                  backgroundColor: AppColors.white,
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 70.0,
                    height: 70.0,
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Text(
                  "Peter McKinnon",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            Divider(
              color: Colors.black38,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                lorem,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              child: Text("Get in Touch"),
              style:
                  ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactForm()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
