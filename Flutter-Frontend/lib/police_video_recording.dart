// video_page.dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  List<Map<String, dynamic>> _videos = []; // List to store fetched videos

  // Replace 'YOUR_API_ENDPOINT' with the actual API endpoint for fetching videos
  final String apiUrl = 'https://gq1rsfm2-3000.inc1.devtunnels.ms/api/videos';

  Future<void> fetchVideos() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      final jsonData = jsonDecode(response.body) as List<dynamic>;

      setState(() {
        _videos = List<Map<String, dynamic>>.from(jsonData);
      });
    } catch (error) {
      print('Error fetching videos: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Page'),
      ),
      body: _buildVideoList(),
    );
  }

  Widget _buildVideoList() {
    if (_videos.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: _videos.length,
        itemBuilder: (context, index) {
          final video = _videos[index];
          return ListTile(
            title: Text(video['title'] ?? 'No title available'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerPage(video['videoUrl']),
                ),
              );
            },
          );
        },
      );
    }
  }
}
