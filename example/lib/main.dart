import 'package:flutter/material.dart';
import 'package:google_places_for_flutter_3/google_places_for_flutter.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: SearchGooglePlacesWidget(
            apiKey: 'Your Google Map API Key goes here',
            // The language of the autocompletion
            language: 'en',
            // The position used to give better recommendations. In this case we are using the user position
            radius: 30000,
            onSelected: (Place place) async {
              final geolocation = await place.geolocation;

              // Will animate the GoogleMap camera, taking us to the selected position with an appropriate zoom
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                  CameraUpdate.newLatLng(geolocation!.coordinates));
              controller.animateCamera(
                  CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
            },
            onSearch: (Place place) {},
          ),
        ),
      ),
    );
  }
}
