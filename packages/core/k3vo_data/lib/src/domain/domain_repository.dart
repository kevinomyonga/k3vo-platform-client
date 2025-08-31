import 'package:dio/dio.dart';

class DomainRepository {
  final Dio _dio;

  DomainRepository({Dio? dio})
      : _dio = dio ?? Dio(BaseOptions(baseUrl: 'http://api.k3vo.me.ke:8080'));

  Future<bool> checkDomain(String domain) async {
    try {
      final response = await _dio.post(
        '/epp/domaincheck',
        data: {'domain': domain},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      // The API returns { domain, exists, message }
      return response.data['exists'] as bool;
    } catch (e) {
      throw Exception('Domain check failed: $e');
    }
  }
}
