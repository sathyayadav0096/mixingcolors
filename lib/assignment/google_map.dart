import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class MapsApi extends StatefulWidget {
  const MapsApi({Key? key}) : super(key: key);

  @override
  State<MapsApi> createState() => _MapsApiState();
}

class _MapsApiState extends State<MapsApi> {
  final Location _locationController = Location();

  LatLng _startLocation = LatLng(13.0826846, 80.2707516);
  LatLng _endLocation = LatLng(9.9252004, 78.11977530000001);

  // static const LatLng _madurai = LatLng(9.9252004, 78.11977530000001);
  // static const LatLng _end_location = LatLng(13.0810129, 80.2709696);
  // static const LatLng _DRIVING = LatLng(13.0784912, 80.2486368);
  CameraPosition cameraAngle =
      CameraPosition(target: LatLng(13.0826846, 80.2707516), zoom: 13);
  LatLng? _currentP;

  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    getGeocode();
    // getLocationUpdates();
  }

  final String _address = "New York, NY"; // Address to geocode
  final String _apiKey =
      "AIzaSyBl0Pm1-cZM3-IdYhEkmEQ2A4XxSJpIRdQ"; // Replace with your actual API key
  String? stln;
  String? stlg;
  String? enln;
  String? enlg;

  Future<void> getGeocode() async {
    print('Step 1: Constructing endpoint URL');
    final String endpoint =
        'https://firebasestorage.googleapis.com/v0/b/jill-soap-6a1ac.appspot.com/o/maps.json?alt=media&token=bfd28b0f-06d7-4d25-8d45-e218466c7449';
    print('Step 2: Sending HTTP request to $endpoint');
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      print('Step 3: Parsing response');
      Map<String, dynamic> data = json.decode(response.body);
      print('Step 4: Printing decoded data');
      stln = data['routes'][0]['legs'][0]['start_location']['lng'].toString();
      stlg = data['routes'][0]['legs'][0]['start_location']['lat'].toString();

      enlg = data['routes'][0]['legs'][0]['end_location']['lng'].toString();
      enln = data['routes'][0]['legs'][0]['end_location']['lat'].toString();
      setState(() {
        cameraAngle = CameraPosition(
            target: LatLng(
              double.parse(stlg.toString()),
              double.parse(stln.toString()),
            ),
            zoom: 13);
      });

      print(stln.toString());
    } else {
      print('Failed to load geocode');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: cameraAngle,
            markers: {
              // Todo below two Madurai
              Marker(
                  markerId: MarkerId('_southwest'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _endLocation),
              Marker(
                  markerId: MarkerId('_southwest'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _startLocation),

              // const Marker(
              //     markerId: MarkerId('Madurai, Tamil Nadu, India'),
              //     icon: BitmapDescriptor.defaultMarker,
              //     position: _madurai),
              //
              // // Todo below two Chennai
              // const Marker(
              //     markerId: MarkerId('Chennai, Tamil Nadu, India'),
              //     icon: BitmapDescriptor.defaultMarker,
              //     position: _end_location),
              // const Marker(
              //     markerId: MarkerId('DRIVING'),
              //     icon: BitmapDescriptor.defaultMarker,
              //     position: _DRIVING),
            },
            polylines: Set<Polyline>.of(polylines.values),
          ),
          if (_currentP != null)
            Positioned(
              top: 20.0,
              left: 20.0,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Current Location: ${_currentP!.latitude}, ${_currentP!.longitude}'),
                ),
              ),
            ),
        ],
      ),
    );
  }

// Future<void> getLocationUpdates() async {
//   bool _serviceEnabled;
//   PermissionStatus _permissionGranted;
//
//   _serviceEnabled = await _locationController.serviceEnabled();
//   if (!_serviceEnabled) {
//     _serviceEnabled = await _locationController.requestService();
//   }
//   if (!_serviceEnabled) {
//     return;
//   }
//
//   _permissionGranted = await _locationController.hasPermission();
//   if (_permissionGranted == PermissionStatus.denied) {
//     _permissionGranted = await _locationController.requestPermission();
//     if (_permissionGranted != PermissionStatus.granted) {
//       return;
//     }
//   }
//   _locationController.onLocationChanged
//       .listen((LocationData currentLocation) {
//     if (currentLocation.latitude != null &&
//         currentLocation.longitude != null) {
//       setState(() {
//         _currentP =
//             LatLng(currentLocation.latitude!, currentLocation.longitude!);
//         print(_currentP);
//         getPolylinePointer(); // Update polyline when location changes
//       });
//     }
//   });
// }

//   Future<void> getPolylinePointer() async {
//     List<LatLng> polylineCoordinates = [];
//     PolylinePoints polylinePoints = PolylinePoints();
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       GOOGLE_MAPS_API_KEY,
//       PointLatLng(_startLocation.latitude, _startLocation.longitude),
//       PointLatLng(_endLocation.latitude, _endLocation.longitude),
//       travelMode: TravelMode.driving,
//     );
//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//     } else {
//       print(result.errorMessage);
//     }
//     generatePolylineFromPoints(polylineCoordinates);
//   }
//
//   void generatePolylineFromPoints(List<LatLng> polylineCoordinates) async {
//     PolylineId id = const PolylineId("poly");
//     Polyline polyline = Polyline(
//         polylineId: id,
//         color: Colors.black,
//         points: polylineCoordinates,
//         width: 8);
//     setState(() {
//       polylines[id] = polyline;
//     });
//
//     // Add polyline from _DRIVING to _start
//     List<LatLng> drivingPolylineCoordinates = [_startLocation, _endLocation];
//     PolylineId drivingId = const PolylineId("driving_poly");
//     Polyline drivingPolyline = Polyline(
//         polylineId: drivingId,
//         color: Colors.blue,
//         points: drivingPolylineCoordinates,
//         width: 8);
//     setState(() {
//       polylines[drivingId] = drivingPolyline;
//     });
//   }
}
