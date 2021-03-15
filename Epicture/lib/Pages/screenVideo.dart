import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoApp extends StatefulWidget {
  VideoApp({this.link, this.title, this.description});
  String link;
  String title;
  String description = " ";


  @override
  _VideoAppState createState() => _VideoAppState(link: this.link, title: this.title, description: this.description);
}

class _VideoAppState extends State<VideoApp> {
  _VideoAppState({this.link, this.title, this.description});
  VideoPlayerController _controller;
  String link;
  String title = " ";
  String description = " ";
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        this.link)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    if (this.title == null) {
      setState(() {
        this.title = " ";
      });
    }
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                child: Text(
                  this.title
                ),
              ),
              Container(
                width: 300,
                height: 300,
                child: _controller.value.initialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(),
              ),
              Container(
                child: Text(
                    this.description
                ),
              ),
            ]
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}