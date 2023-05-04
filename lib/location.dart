import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
    Position? _position = null;

  Future<Position?> _fetchPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, display an error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Location services are disabled'),
      ));
      return null;
    }

    // Check if the user has granted permission to access their location
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Request permission to access location
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // The user denied permission, display an error message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Location permission was denied'),
        ));
        return null;
      }
    }

    // Check if the user has permanently denied permission to access their location
    if (permission == LocationPermission.deniedForever) {
      // The user has permanently denied permission, display an error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Location permission is permanently denied'),
      ));
      return null;
    }

    // Get the user's current position
    Position currentPosition =
        await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    return currentPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                Position? position = await _fetchPosition();
                setState(() {
                  _position = position!;
                });
              },
              child: Text('Get my location'),
            ),
            SizedBox(height: 16.0),
            if (_position != null)
              Text(
                'Latitude: ${_position?.latitude}, Longitude: ${_position?.longitude}',
                style: TextStyle(fontSize: 24.0),
              ),
          ],
        ),
      ),
    );
  }
}
