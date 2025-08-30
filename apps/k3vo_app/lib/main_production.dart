import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:k3vo/app/app.dart';
import 'package:k3vo/bootstrap.dart';
import 'package:k3vo/env/dotenv_config.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load .env first
  await dotenv.load(fileName: ".env");

  // Initialize foundation with DotEnvConfig
  await K3voFoundation.initialize(envConfig: DotEnvConfig());

  await bootstrap(() => const App());
}
