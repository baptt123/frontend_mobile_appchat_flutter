import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
void main(){
  runApp(GetLocationGoogleMapUI());
}
class GetLocationGoogleMapUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        body: Center(
          child: TextButton(
            child: Text('Lấy tọa độ hiện tại'),
            onPressed: () {
              getLocation();
            },
          ),
        ),
      ),
    ));
  }
void getLocation () async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
}
}
