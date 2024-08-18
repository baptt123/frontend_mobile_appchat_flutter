import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/post.dart';
part 'RetrofitCallAPI.g.dart';
@RestApi(baseUrl: 'http://localhost:8080/getdata')
abstract class RetrofitCallApi{
  factory RetrofitCallApi(Dio dio, {String baseUrl}) = _RetrofitCallApi;

  @GET("/getmessage")
  Future<List<Post>> getListPost();
}