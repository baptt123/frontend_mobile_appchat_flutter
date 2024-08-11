import 'package:flutter/material.dart';

void main() {
  runApp(LoginUI());
}

class LoginUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Trang đăng nhập'),
            backgroundColor: Color(0xFF42A5F5),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 200, bottom: 20, right: 20),
                    child: TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                          hintText: 'Tài khoản',
                          border: OutlineInputBorder(),
                          fillColor: Colors.white),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                          hintText: 'Mật khẩu ',
                          border: OutlineInputBorder(),
                          fillColor: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
