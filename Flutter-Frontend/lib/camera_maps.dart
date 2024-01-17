import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'video_player_page.dart';

class CameraMaps extends StatefulWidget {
  const CameraMaps({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CameraMapsState createState() => _CameraMapsState();
}

class _CameraMapsState extends State<CameraMaps> {
  final Completer<GoogleMapController> _controller = Completer();

  List<String> images = [
    'images/car.png',
    'images/car2.png',
    'images/marker2.png',
    'images/marker3.png',
    'images/marker.png',
    'images/motorcycle.png',
  ];

  final List<Marker> _markers = <Marker>[];
  final List<LatLng> _latLang = [
    const LatLng(26.9124, 75.7873),
    const LatLng(26.8666, 75.8128),
    const LatLng(26.7982, 75.8245),
    const LatLng(26.8665, 75.8079),
    const LatLng(26.8978, 75.8217),
    const LatLng(26.9124, 75.7873),
    const LatLng(26.8676, 75.8128),
    const LatLng(26.7982, 75.8245),
    const LatLng(26.8695, 75.8079),
    const LatLng(26.8978, 75.8217),
  ];

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(26.9124, 75.7873),
    zoom: 12,
  );

  @override
  void initState() {
    super.initState();
    loadData();
    _controller.future.then((value) => value.showMarkerInfoWindow(
        MarkerId(_markers.length.toString()))); // Show info window on load
  }

  // Load marker data and images
  loadData() async {
    for (int i = 0; i < images.length; i++) {
      _markers.add(Marker(
        markerId: MarkerId(i.toString()),
        position: _latLang[i],
        icon: await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(48, 48)),
            'assets/images/image_pin.png'),
        anchor: const Offset(.1, .1),
        infoWindow: InfoWindow(
          title: 'CamID $i',
          onTap: () {
            // Navigate to the VideoPage when the marker is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CameraDetails(
                      'https://youtu.be/SVgVzEVeP4Q?si=KV26gsVcs6mvMnww')),
            );
          },
        ),
      ));

      setState(() {});
    }
  }

  // Custom map style
  String _mapStyle = '';

  _onMapCreated(GoogleMapController controller, Set<Marker> markers) {
    if (mounted) {
      setState(() {
        _controller.complete(controller);
        controller.setMapStyle(_mapStyle);
        for (var marker in markers) {
          controller.showMarkerInfoWindow(marker.markerId);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          myLocationButtonEnabled: false,
          liteModeEnabled: false,
          myLocationEnabled: false,
          markers: Set<Marker>.of(_markers),
          onMapCreated: (GoogleMapController controller) {
            // _controller.complete(controller);
            _onMapCreated(controller, _markers.toSet());
          },
          trafficEnabled: false,
          buildingsEnabled: false,
          mapToolbarEnabled: false,
          indoorViewEnabled: false,
          zoomControlsEnabled: false,
        ),
      ),
    );
  }
}
