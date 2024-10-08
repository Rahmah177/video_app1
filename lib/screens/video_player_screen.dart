import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  VideoPlayerScreen(this.videoUrl);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    IconData icon;

    if (_controller.value.isPlaying) {
      icon = Icons.pause;
    } else {
      icon = Icons.play_arrow;
    }

    Widget content;

    if (_controller.value.isInitialized) {
      content = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
          VideoProgressIndicator(_controller, allowScrubbing: true),
          IconButton(
            icon: Icon(icon),
            onPressed: () {
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              });
            },
          ),
        ],
      );
    } else {
      content = CircularProgressIndicator();
    }

    return Center(child: content);
  }
}
