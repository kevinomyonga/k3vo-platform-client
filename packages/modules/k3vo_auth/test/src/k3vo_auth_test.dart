// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:k3vo_auth/k3vo_auth.dart';

void main() {
  group('K3voAuth', () {
    test('can be instantiated', () {
      expect(K3voAuth(), isNotNull);
    });
  });
}
