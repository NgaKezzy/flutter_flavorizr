import 'package:dio/dio.dart';
import 'dio_service.dart';

class ApiService {
  final Dio _dio = DioService.dio;

  Future<dynamic> getUsers() async {
    try {
      final response = await _dio.get('/users');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Thêm các phương thức API khác
}