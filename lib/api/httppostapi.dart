import 'dart:ffi';
import 'package:http/http.dart';

mixin class HttpCallingAPI {
  Future<Void>? callingPost() async {
    Response response =
        await get("localhost:8080/api/getdata/getposts" as Uri) as Response;
    if (response.statusCode == 200) {
      print(response.statusCode);
      return Future.value();
    } else {
      print(response.statusCode);
      return Future.value();
    }
  }
}
