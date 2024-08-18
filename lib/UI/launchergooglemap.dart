import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(LauncherGoogleMapUI());
}

class LauncherGoogleMapUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: TextButton(
              onPressed: () {
                _launchURL();
              },
              child: Text('Chuyển hướng google map'),
            ),
          ),
        ),
      ),
    );
  }

  void _launchURL() async {
    const url = 'https://maps.app.goo.gl/D1kt3uzvk2FWMDW88';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
