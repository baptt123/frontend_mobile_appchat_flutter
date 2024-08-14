import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: RegisterUI(),
  ));
}

class RegisterUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterUIState();
}

class RegisterUIState extends State<RegisterUI> {
  TextEditingController birthdayController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // DateTime selectTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        home: SafeArea(
            child: Scaffold(
      appBar: AppBar(
          title: Text('Đăng kí',
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.lightBlue),
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    suffixIcon: Icon(Icons.account_circle_rounded),
                    hintText: 'Họ tên',
                  ),
                  keyboardType: TextInputType.text)),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  suffixIcon: Icon(Icons.account_circle_rounded),
                  hintText: 'Tên tài khoản',
                ),
                keyboardType: TextInputType.text),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  suffixIcon: Icon(Icons.mail),
                  hintText: 'Email',
                ),
                keyboardType: TextInputType.text),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  suffixIcon: Icon(Icons.lock),
                  hintText: 'Mật khẩu',
                ),
                keyboardType: TextInputType.text),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: TextField(
              controller: birthdayController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                suffixIcon: IconButton(
                  padding: EdgeInsets.only(right: 17),
                  icon: Icon(Icons.cake),
                  onPressed: () async {
                    DateTime? dateTime = await showDatePicker(
                      context: context,
                      // initialDate: selectTime,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000),
                    );
                    setState(() {
                      if (dateTime != null) {
                        birthdayController.text =
                        '${dateTime.day}/${dateTime.month}/${dateTime.year}';
                      } else {
                        birthdayController.text = '';
                      }
                    });
                  },
                ),
                hintText: 'Ngày sinh',
              ),
              keyboardType: TextInputType.datetime,
            ),
          ),


        ],
      ),
    )));
  }
}
