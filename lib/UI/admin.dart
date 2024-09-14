import 'package:flutter/material.dart';

class AdminUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AdminUIState();
}

class AdminUIState extends State<AdminUI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Quản trị tài khoản'),
            centerTitle: true,
          ),
          body: Center(
            child: DataTable(
              columns: [
                DataColumn(label: Text('STT')),
                DataColumn(label: Text('Tên')),
                DataColumn(label: Text('SL Bài đăng ')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Nguyễn Văn A')),
                  DataCell(Text('A')),
                ]),
                DataRow(cells: [
                  DataCell(Text('2')),
                  DataCell(Text('Trần Thị B')),
                  DataCell(Text('B-')),
                ]),
                DataRow(cells: [
                  DataCell(Text('3')),
                  DataCell(Text('Hoàng Thái C')),
                  DataCell(Text('A')),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
