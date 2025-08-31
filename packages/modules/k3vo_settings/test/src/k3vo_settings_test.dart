// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:k3vo_settings/k3vo_settings.dart';

void main() {
  group('K3voSettings', () {
    test('can be instantiated', () {
      expect(K3voSettings(), isNotNull);
    });
  });
}
