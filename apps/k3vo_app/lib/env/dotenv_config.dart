import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';

class DotEnvConfig implements Env {
  @override
  String get k3voApiBaseUrl =>
      dotenv.env['K3VO_API_BASE_URL'] ??
      const String.fromEnvironment('K3VO_API_BASE_URL', defaultValue: '');

  @override
  String get geminiApiKey =>
      dotenv.env['GEMINI_API_KEY'] ??
      const String.fromEnvironment('GEMINI_API_KEY', defaultValue: '');
}
