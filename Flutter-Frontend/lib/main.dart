import 'package:flutter/material.dart';
import 'package:renegan/community.dart';
import 'package:renegan/notification.dart';
import 'package:renegan/search.dart';

import 'camera_maps.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _currentWidget = const CameraMaps();

  void _setCurrentWidget(Widget widget) {
    setState(() {
      _currentWidget = widget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geotagged Cameras Map',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            // 'Geotagged Cameras Map',
            _currentWidget is CommunityPage
                ? 'Community Section'
                : _currentWidget is CameraMaps
                    ? 'Geotagged Cameras Map'
                    : 'Notification Section',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          centerTitle: false,
          leading: SizedBox(),
          leadingWidth: 25,
          actions: [
            TextButton(
              onPressed: () {
                _setCurrentWidget(
                  _currentWidget is CommunityPage
                      ? const CameraMaps()
                      : const CommunityPage(),
                );
              },
              child: Text(
                _currentWidget is CommunityPage ? 'Map' : 'Community',
                style: const TextStyle(color: Colors.blue),
              ),
            ),
            IconButton(
              onPressed: () {
                _setCurrentWidget(const NotificationPage());
              },
              icon: const Icon(Icons.notifications),
            ),
            IconButton(
              onPressed: () {
                _setCurrentWidget(GoogleSearchPlacesApi());
              },
              icon: const Icon(Icons.search),
            ),
            SizedBox(width: 16.0),
          ],
        ),
        body: _currentWidget,
        // body: const CommunityPage(),
      ),
    );
  }
}
