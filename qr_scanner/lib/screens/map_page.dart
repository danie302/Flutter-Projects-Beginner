import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:qr_scanner/models/models.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    final lat = double.parse(scan.value.split(',')[0]);
    final lng = double.parse(scan.value.split(',')[1]);

    final CameraPosition initialPosition = CameraPosition(
      target: LatLng(lat, lng),
      zoom: 17.4746,
    );

    Set<Marker> markers = new Set<Marker>();
    markers.add(Marker(
      markerId: MarkerId(scan.id.toString()),
      position: LatLng(lat, lng),
      infoWindow: InfoWindow(
        title: scan.value,
        snippet: scan.id.toString(),
      ),
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  initialPosition,
                ),
              );
            },
          ),
        ],
      ),
      body: GoogleMap(
        markers: markers,
        mapType: mapType,
        myLocationButtonEnabled: false,
        initialCameraPosition: initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers),
        onPressed: () {
          setState(() {
            mapType =
                mapType == MapType.normal ? MapType.satellite : MapType.normal;
          });
        },
      ),
    );
  }
}
