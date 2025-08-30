import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';

class DotEnvConfig implements Env {
  @override
  String get k3voApiBaseUrl => dotenv.env['K3VO_API_BASE_URL'] ?? '';

  @override
  String get geminiApiKey => dotenv.env['GEMINI_API_KEY'] ?? '';
}
