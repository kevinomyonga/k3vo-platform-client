import 'package:k3vo_auth/k3vo_auth.dart';

abstract class IAuthStateProvider {
  Stream<AuthState> get authStateStream;
}
