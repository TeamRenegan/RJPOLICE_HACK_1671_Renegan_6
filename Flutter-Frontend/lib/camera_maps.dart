import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
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
    // const LatLng(26.8676, 75.8128),
    // const LatLng(26.7982, 75.8245),
    // const LatLng(26.8695, 75.8079),
    const LatLng(26.8978, 75.8217),
  ];

  final List<double> _angles = [
    0.0,
    45.0,
    180.0,
    270.0,
    360.0,
    0.0,
    90.0,
    180.0,
    270.0,
    360.0,
  ];

  final List<int> _fovs = [
    120,
    60,
    60,
    60,
    60,
    60,
    60,
    60,
    60,
    60,
  ];

  final Set<Polygon> _polygons = <Polygon>{};

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
          const ImageConfiguration(
            size: Size(48, 48),
          ),
          kIsWeb ? 'assets/images/image_pin.png' : 'assets/images/med.png',
        ),
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
    }

    // Add polygons for every camera with given angle and fov
    for (int i = 0; i < _latLang.length; i++) {
      _polygons.add(Polygon(
        polygonId: PolygonId(i.toString()),
        fillColor: Colors.blue.withOpacity(0.2),
        strokeColor: Colors.blue,
        strokeWidth: 0,
        points: [
          _latLang[i],
          calculateNewLatLng(_latLang[i], _angles[i] - _fovs[i] / 2, 0.1),
          calculateNewLatLng(_latLang[i], _angles[i] - _fovs[i] / 3, 0.1),
          calculateNewLatLng(_latLang[i], _angles[i] - _fovs[i] / 4, 0.1),
          calculateNewLatLng(_latLang[i], _angles[i] - _fovs[i] / 5, 0.1),
          calculateNewLatLng(_latLang[i], _angles[i] - _fovs[i] / 6, 0.1),
          calculateNewLatLng(_latLang[i], _angles[i] - _fovs[i] / 7, 0.1),
          calculateNewLatLng(_latLang[i], _angles[i] - _fovs[i] / 8, 0.1),
          calculateNewLatLng(_latLang[i], _angles[i] - _fovs[i] / 9, 0.1),
          calculateNewLatLng(_latLang[i], _angles[i], 0.1),
          calculateNewLatLng(_latLang[i], _angles[i] + _fovs[i] / 9, 0.1),
          calculateNewLatLng(_latLang[i], _angles[i] + _fovs[i] / 8, 0.1),
          calculateNewLatLng(_latLang[i], _angles[i] + _fovs[i] / 7, 0.1),
          calculateNewLatLng(_latLang[i], _angles[i] + _fovs[i] / 6, 0.1),
          calculateNewLatLng(_latLang[i], _angles[i] + _fovs[i] / 5, 0.1),
          calculateNewLatLng(_latLang[i], _angles[i] + _fovs[i] / 4, 0.1),
          calculateNewLatLng(_latLang[i], _angles[i] + _fovs[i] / 3, 0.1),
          calculateNewLatLng(_latLang[i], _angles[i] + _fovs[i] / 2, 0.1),
        ].map((e) => decrementToAdjust(e)).toList(),
      ));
    }

    setState(() {});
  }

  LatLng decrementToAdjust(LatLng latLng) {
    return LatLng(latLng.latitude - 0.000015, latLng.longitude + 0.00001);
  }

  LatLng calculateNewLatLng(LatLng startPoint, double angle, double distance) {
    // Radius of the Earth in kilometers
    const double earthRadius = 6371.0;

    // Convert distance from kilometers to radians
    final double distanceRadians = distance / earthRadius;

    // Convert angles from degrees to radians
    final double startLatRadians = startPoint.latitude * pi / 180.0;
    final double startLngRadians = startPoint.longitude * pi / 180.0;
    final double angleRadians = angle * pi / 180.0;

    // Calculate new latitude and longitude
    final double newLatRadians = asin(
        sin(startLatRadians) * cos(distanceRadians) +
            cos(startLatRadians) * sin(distanceRadians) * cos(angleRadians));
    final double newLngRadians = startLngRadians +
        atan2(sin(angleRadians) * sin(distanceRadians) * cos(startLatRadians),
            cos(distanceRadians) - sin(startLatRadians) * sin(newLatRadians));

    // Convert back to degrees
    final double newLatitude = newLatRadians * 180.0 / pi;
    final double newLongitude = newLngRadians * 180.0 / pi;

    return LatLng(newLatitude, newLongitude);
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
          polygons: _polygons,
        ),
      ),
    );
  }
}
