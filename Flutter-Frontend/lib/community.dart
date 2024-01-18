import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Community Section',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        hintColor: Colors.brown.shade200,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const CommunityPage(),
    );
  }
}

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 100.0 : 16.0),
        child: ListView.builder(
          padding: const EdgeInsets.all(4.0),
          itemCount: 6,
          itemBuilder: (context, index) {
            return CommunityCard(
              userName: 'User $index',
              profileImage: 'https://placekitten.com/50/50?image=$index',
              incidentHeading: 'Incident $index',
              incidentDetails:
                  'Details about incident $index. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              videoUrl: 'https://www.example.com/sample_video_$index.mp4',
            );
          },
        ),
      ),
    );
  }
}

class CommunityCard extends StatelessWidget {
  final String userName;
  final String profileImage;
  final String incidentHeading;
  final String incidentDetails;
  final String videoUrl;

  const CommunityCard({
    required this.userName,
    required this.profileImage,
    required this.incidentHeading,
    required this.incidentDetails,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(profileImage),
            ),
            title: Text(userName),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  incidentHeading,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  incidentDetails,
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 16.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPlayerPage(
                            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.brown,
                    margin: const EdgeInsets.only(
                      right: kIsWeb ? 1100.0 : 0,
                      // vertical: 4.0,
                    ),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: const Center(
                      child: Text(
                        'Watch Video',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () {
                  // Handle like action
                },
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  // Handle share action
                },
              ),
              IconButton(
                icon: const Icon(Icons.repeat),
                onPressed: () {
                  // Handle repost action
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class VideoPlayerPage extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerPage(this.videoUrl, {Key? key}) : super(key: key);

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    initVideo();
  }

  void initVideo() async {
    _controller = VideoPlayerController.network(widget.videoUrl);
    await _controller.initialize();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const Text('Loading Video...'),
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
