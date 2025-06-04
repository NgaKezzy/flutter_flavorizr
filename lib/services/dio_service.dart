import 'package:dio/dio.dart';
import '../config/environment.dart';

class DioService {
  static Dio? _dio;

  static Dio get dio {
    if (_dio == null) {
      _dio = Dio(BaseOptions(
        baseUrl: EnvironmentConfig.instance.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ));
      
      // Thêm interceptors nếu cần
      _dio!.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
    }
    return _dio!;
  }
}