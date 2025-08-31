import 'package:dio/dio.dart';

class WhoisRepository {
  WhoisRepository({Dio? dio})
    : _dio = dio ?? Dio(BaseOptions(baseUrl: 'http://api.k3vo.me.ke:8080'));
  final Dio _dio;

  Future<Map<String, dynamic>> lookupDomain(String domain) async {
    try {
      final response = await _dio.post(
        '/whois',
        data: {'domain': domain},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception('Failed to fetch WHOIS data');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? 'Network error');
    }
  }
}
