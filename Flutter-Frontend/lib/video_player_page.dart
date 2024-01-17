// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class CameraDetails extends StatefulWidget {
  final String videoUrl;

  const CameraDetails(this.videoUrl, {super.key});

  @override
  _CameraDetailsState createState() => _CameraDetailsState();
}

class _CameraDetailsState extends State<CameraDetails> {
  late VideoPlayerController _controller;

  final String ownerDetailsUrl =
      'https://gq1rsfm2-3000.inc1.devtunnels.ms/api/cameraowners/cameraId/:_id';
  final String cameraDetailsUrl =
      'https://gq1rsfm2-3000.inc1.devtunnels.ms/api/cameras/cameras/';

  Map<String, dynamic> dummyOwnerDetails = {
    '_id': '01',
    'user': {
      'name': 'Vikram Singh',
      'email': 'vikram@gmail.com',
      'contactNo': '1234567890'
    }
  };

  List<Map<String, dynamic>> dummyCameraDetailsList = [
    {
      'id': '01',
      'model': 'SmartCam XYZ-2000',
      'resolution': '1920x1080',
      'frame_rate': '30 FPS',
      'visibility_range': '50 meters',
      'location': 'Rajasthan, Jaipur, 302001, India, Sample Street 123',
      'video_url': 'https://example.com/dummy_video.mp4',
    }
  ];

  Map<String, dynamic>? ownerDetails;
  late List<Map<String, dynamic>> cameraDetailsList;

  @override
  void initState() {
    ownerDetails = null;
    cameraDetailsList = [];
    fetchOwnerDetails('65a7aee8174a407b75b11a12');
    fetchCameraDetails();
    super.initState();
  }

  Future<void> fetchOwnerDetails(String cameraId) async {
    try {
      final response = await http
          .get(Uri.parse(ownerDetailsUrl.replaceAll(':_id', cameraId)));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          print(data);
          ownerDetails = data;
        });
      } else {
        throw Exception('Failed to load camera owner details');
      }
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  Future<void> fetchCameraDetails() async {
    try {
      final response = await http.get(Uri.parse('$cameraDetailsUrl:id'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          cameraDetailsList = [data];
        });
      } else {
        throw Exception('Failed to load camera details');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Details'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Owner Details
              _buildSectionTitle('Owner Details'),
              if (ownerDetails != null) ...[
                _buildOwnerDetails(ownerDetails!),
                const Divider(),
              ] else
                _buildDefaultOwnerDetails(),

              // Camera Details
              _buildSectionTitle('Camera Details'),
              if (cameraDetailsList.isNotEmpty) ...[
                for (final camera in cameraDetailsList)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildCameraDetails(camera),
                      const SizedBox(height: 16.0),
                      _buildButtonsRow(camera['video_url'] ??
                          dummyCameraDetailsList[0]['video_url']),
                      const Divider(),
                    ],
                  ),
              ] else
                _buildDefaultCameraDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildOwnerDetails(Map<String, dynamic> ownerDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailItem('Owner ID', ownerDetails['_id']),
        _buildDetailItem('Name', ownerDetails['user']['name']),
        _buildDetailItem('Email', ownerDetails['user']['email']),
        _buildDetailItem('Contact Number', ownerDetails['user']['contactNo']),
      ],
    );
  }

  Widget _buildDefaultOwnerDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailItem('Owner ID', dummyOwnerDetails['_id']),
        _buildDetailItem('Name', dummyOwnerDetails['user']['name']),
        _buildDetailItem('Email', dummyOwnerDetails['user']['email']),
        _buildDetailItem(
            'Contact Number', dummyOwnerDetails['user']['contactNo']),
      ],
    );
  }

  Widget _buildCameraDetails(Map<String, dynamic> camera) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailItem('Camera ID', camera['id']),
        _buildDetailItem('Model', camera['model'] ?? 'Default Model'),
        _buildDetailItem(
            'Resolution', camera['resolution'] ?? 'Default Resolution'),
        _buildDetailItem(
            'Frame Rate', camera['frame_rate'] ?? 'Default Frame Rate'),
        _buildDetailItem('Visibility Range',
            camera['visibility_range'] ?? 'Default Visibility Range'),
        _buildDetailItem('Location', camera['location'] ?? 'Default Location'),
      ],
    );
  }

  Widget _buildDefaultCameraDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailItem('Camera ID', dummyCameraDetailsList[0]['id']),
        _buildDetailItem('Model', dummyCameraDetailsList[0]['model']),
        _buildDetailItem('Resolution', dummyCameraDetailsList[0]['resolution']),
        _buildDetailItem('Frame Rate', dummyCameraDetailsList[0]['frame_rate']),
        _buildDetailItem(
            'Visibility Range', dummyCameraDetailsList[0]['visibility_range']),
        _buildDetailItem('Location', dummyCameraDetailsList[0]['location']),
      ],
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '$label: $value',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildButtonsRow(String videoUrl) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            playLiveFootage(videoUrl);
          },
          child: const Text('View Live Footage'),
        ),
        const SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {
            // Handle recordings/history button click
            // You can navigate to another screen or handle it accordingly
          },
          child: const Text('See Recordings/History'),
        ),
      ],
    );
  }

  void playLiveFootage(String videoUrl) async {
    // ignore: deprecated_member_use
    _controller = VideoPlayerController.network(videoUrl);
    await _controller.initialize();
    setState(() {});
  }
}
