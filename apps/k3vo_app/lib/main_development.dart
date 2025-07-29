import 'package:flutter/material.dart';
import 'package:k3vo/app/app.dart';
import 'package:k3vo/bootstrap.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await K3voFoundation.initialize();
  await bootstrap(() => const App());
}
