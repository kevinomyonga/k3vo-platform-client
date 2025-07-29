// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';

void main() {
  group('K3voFoundation', () {
    test('can be instantiated', () {
      expect(K3voFoundation(), isNotNull);
    });
  });
}
