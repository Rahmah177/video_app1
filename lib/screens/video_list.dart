import 'package:flutter/material.dart';
import 'package:video_app2/api/api_service.dart';
import '../models/video_model.dart';
import 'video_player_screen.dart';

class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  List<Video> videos = [];
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    videos = await apiService.fetchVideos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Reels'),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Center(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (videos.isEmpty) {
      return CircularProgressIndicator();
    } else {
      return PageView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return VideoPlayerScreen(videos[index].videoUrl);
        },
      );
    }
  }
}
