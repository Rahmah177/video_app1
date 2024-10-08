import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:video_app2/models/video_model.dart';

class ApiService {
  Future<List<Video>> fetchVideos() async {
    final response =
        await http.get(Uri.parse('https://api.sawalef.app/api/v1/reels'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((video) => Video.fromJson(video)).toList();
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
