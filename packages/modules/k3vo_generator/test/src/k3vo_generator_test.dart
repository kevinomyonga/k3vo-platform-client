// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:k3vo_generator/k3vo_generator.dart';

void main() {
  group('K3voGenerator', () {
    test('can be instantiated', () {
      expect(K3voGenerator(), isNotNull);
    });
  });
}
