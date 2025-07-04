import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/networking/api_endpoint.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;
  static initDio() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiEndpoint.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio!.interceptors.add(PrettyDioLogger());
  }

  static getRequest({
    required String endPoint,
    required Map<String, dynamic> query,
  }) async {
    try {
      Response response = await dio!.get(endPoint, queryParameters: query);
      return response;
    } catch (e) {
      print(e.toString());
    }
  }

  static postRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await dio!.post(endPoint, data: data);
      return response;
    } catch (e) {
      print(e.toString());
    }
  }
}
