import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:k3vo/app/app.dart';
import 'package:k3vo/bootstrap.dart';
import 'package:k3vo/env/dotenv_config.dart';
import 'package:k3vo/firebase/firebase_options_dev.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Load .env first
  await dotenv.load();

  // Initialize foundation with DotEnvConfig
  await K3voFoundation.initialize(envConfig: DotEnvConfig());

  // await K3voFoundation.initialize();
  await bootstrap(() => const App());
}
