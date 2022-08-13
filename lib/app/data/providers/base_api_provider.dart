import 'package:dio/dio.dart';

class BaseApiProvider {
  late Dio _dio;
  final baseUrl =
      "https://script.google.com/macros/s/AKfycbwYWemEXAwcPNF2hI5J8oQgyo1mgoHYekBpRALi_5Xieu5IX9p1EBkRQ7rvt2HaQ44S_g/exec";

  BaseApiProvider() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));

    initializeInterceptors();
  }

  Future<Response> _request(String path, {required String method}) async {
    Response response;
    try {
      response = await _dio.request(path, options: Options(method: method));
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> get({String? path}) async {
    return _request(path ?? baseUrl, method: 'get');
  }

  Future<Response> post({String? path, Map<String, dynamic>? body}) async {
    Response? response;
    Map<String, dynamic> httpHeaders = {
      'Accept': 'application/json; utf-8',
      'Content-Type': 'application/json',
    };
    try {
      response = await _dio.request(path ?? baseUrl,
          queryParameters: body,
          options: Options(headers: httpHeaders, method: 'post'));
    } on DioError catch (e) {
      if (e.response?.statusCode == 302) {
        var url = e.response?.headers['location']!.first;
        return response = await _dio.get(url!,
            queryParameters: body, options: Options(method: 'get'));
      }
      throw Exception(e.message);
    }
    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("${options.method} ${options.path}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          return handler.next(e);
        },
      ),
    );
  }
}
