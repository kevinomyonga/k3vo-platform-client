// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:k3vo_data/k3vo_data.dart';

void main() {
  group('K3voData', () {
    test('can be instantiated', () {
      expect(K3voData(), isNotNull);
    });
  });
}
