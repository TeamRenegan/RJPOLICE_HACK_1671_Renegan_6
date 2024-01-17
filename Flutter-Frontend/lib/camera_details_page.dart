import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class CameraDetailsPage extends StatefulWidget {
  const CameraDetailsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CameraDetailsPageState createState() => _CameraDetailsPageState();
}

class _CameraDetailsPageState extends State<CameraDetailsPage> {
  final TextEditingController cameraTypeController = TextEditingController();
  final TextEditingController serialNumberController = TextEditingController();
  final TextEditingController resolutionController = TextEditingController();
  final TextEditingController fovController = TextEditingController();
  final TextEditingController rtspUrlController = TextEditingController();
  final TextEditingController frameRateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  File? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<void> _registerCamera() async {
    // Extract data from controllers and image
    String cameraType = cameraTypeController.text;
    String serialNumber = serialNumberController.text;
    String resolution = resolutionController.text;
    String fov = fovController.text;
    String rtspUrl = rtspUrlController.text;
    String frameRate = frameRateController.text;

    // Convert image to base64 (optional)
    String? base64Image;
    if (_image != null) {
      List<int> imageBytes = await _image!.readAsBytes();
      base64Image = base64Encode(imageBytes);
    }

    // Ensure required fields are not empty
    if (cameraType.isEmpty ||
        serialNumber.isEmpty ||
        resolution.isEmpty ||
        fov.isEmpty ||
        rtspUrl.isEmpty ||
        frameRate.isEmpty) {
      print('Please fill in all the required fields.');
      return;
    }

    // Prepare data for the POST request
    Map<String, dynamic> requestData = {
      'cameraType': cameraType,
      'serialNumber': serialNumber,
      'resolution': resolution,
      'fov': fov,
      'rtspUrl': rtspUrl,
      'frameRate': frameRate,
    };

    // Include base64Image if it's not null
    if (base64Image != null) {
      requestData['base64Image'] = base64Image;
    }

    // Send POST request
    try {
      final response = await http.post(
        Uri.parse('YOUR_API_ENDPOINT'), // Replace with your actual API endpoint
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestData),
      );

      // Handle the response
      if (response.statusCode == 200) {
        // Successful registration
        print('Camera registered successfully!');
      } else {
        // Registration failed
        print('Failed to register camera. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during the HTTP request: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: cameraTypeController,
                decoration:
                    const InputDecoration(labelText: 'Camera Type/Model'),
              ),
              TextField(
                controller: serialNumberController,
                decoration: const InputDecoration(labelText: 'Serial Number'),
              ),
              TextField(
                controller: resolutionController,
                decoration: const InputDecoration(labelText: 'Resolution'),
              ),
              TextField(
                controller: fovController,
                decoration: const InputDecoration(labelText: 'Field of View'),
              ),
              TextField(
                controller: rtspUrlController,
                decoration: const InputDecoration(labelText: 'RTSP URL'),
              ),
              TextField(
                controller: frameRateController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Frame Rate'),
              ),
              ElevatedButton(
                onPressed: _getImage,
                child: const Text('Upload Image'),
              ),
              _image != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(
                        _image!,
                        height: 100,
                      ),
                    )
                  : Container(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registerCamera,
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
