import 'package:flutter/material.dart';

class BuildDialog {
  void buildingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Xóa bạn bè'),
              content: Text('Bạn có muốn xóa bạn bè này không?'),
              actions: [
                TextButton(
                    onPressed: () {
                      print('Có');
                    },
                    child: Text('Có')),
                TextButton(
                    onPressed: () => {print('Không ')}, child: Text('Không'))
              ],
            ));
  }
}
