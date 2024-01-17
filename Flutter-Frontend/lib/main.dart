import 'package:flutter/material.dart';

import 'camera_maps.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          title: const Text(
            'Geotagged Cameras Map',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          centerTitle: false,
        ),
        body: const CameraMaps(),
      ),
    );
  }
}
