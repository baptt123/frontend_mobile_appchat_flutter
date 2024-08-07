import 'package:flutter/material.dart';

void main() {
  runApp(LoginUI());
}

class LoginUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      checkerboardOffscreenLayers: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Trang đăng nhập'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          width: 500,
          height: 500,
          color: Colors.white,
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.ltr,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Center(
                  heightFactor: 50,
                  widthFactor: 50,
                  child: Image.asset('asset/flutter_img.png'),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Expanded(
                          child: TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Tài khoản',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Expanded(
                          child: TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Mật khẩu',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
