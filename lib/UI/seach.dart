import 'package:flutter/material.dart';

void main() {
  runApp(SearchUI());
}

class SearchUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchUIState();
}

class SearchUIState extends State<SearchUI> {
  final _textSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                setState(() {});
              },
            ),
            title: TextField(
              controller: _textSearch,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.zero, right: Radius.zero))),
              keyboardType: TextInputType.text,
            ),
          ),
        ),
      ),
    );
  }
}
