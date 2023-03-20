import 'package:dio/dio.dart';

class AudioDioHelper{
  static Dio? dio;

  static init(){
    dio=Dio(
        BaseOptions(
          baseUrl: 'https://api.quran.com/api/v4/',
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

}