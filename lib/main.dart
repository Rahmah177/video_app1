import 'package:flutter/material.dart';
import 'package:video_app2/screens/video_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VideoList(),
    );
  }
}
