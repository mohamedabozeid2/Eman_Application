import 'package:dio/dio.dart';

class AzkarDioHelper{
  static Dio? dio;

  static init(){
    dio=Dio(
        BaseOptions(
          baseUrl: 'https://ayah.nawafdev.com/',
          receiveDataWhenStatusError: true,
        )
    );
  }



  static Future<Response> getData({
    required String url,
    Map<String,dynamic>? query,
    String? lang='en-US',
  })async{
    dio!.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
    };
    return await dio!.get(url,queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    required Map<String,dynamic> data,
    Map<String,dynamic>? query,
    String? contentType = 'application/json',
    String? lang='en-US',
  })async{
    dio!.options.headers={
      'Content-Type':contentType,
      'lang':lang,
    };

    return await dio!.post(url,data: data,queryParameters: query);
  }

}