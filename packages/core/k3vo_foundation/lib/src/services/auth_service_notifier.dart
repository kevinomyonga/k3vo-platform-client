import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:k3vo_auth/k3vo_auth.dart';

/// Represents the high-level authentication status of the user.
/// Keeps the UI logic simpler by abstracting [AuthState]s from AuthBloc.
enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

/// A notifier that listens to the [IAuthStateProvider] (e.g., AuthBloc)
/// and exposes a simplified [AuthStatus] to the app.
///
/// Can be injected via GetIt and used anywhere in the app.
class AuthStatusNotifier extends ChangeNotifier {
  final IAuthStateProvider _authStateProvider;
  late final StreamSubscription<AuthState> _subscription;

  AuthStatus _status = AuthStatus.unknown;
  AuthStatus get status => _status;

  AuthStatusNotifier(this._authStateProvider) {
    // Initial state
    _status = _mapAuthStateToStatus(_authStateProvider is AuthBloc
        ? (_authStateProvider as AuthBloc).state
        : null);

    // Listen for future updates
    _subscription =
        _authStateProvider.authStateStream.listen(_onAuthStateChanged);
  }

  void _onAuthStateChanged(AuthState state) {
    final newStatus = _mapAuthStateToStatus(state);
    if (newStatus != _status) {
      _status = newStatus;
      notifyListeners();
    }
  }

  AuthStatus _mapAuthStateToStatus(AuthState? state) {
    if (state == null) return AuthStatus.unknown;

    if (state is AuthSuccess) return AuthStatus.authenticated;
    if (state is AuthInitial) return AuthStatus.unauthenticated;

    return AuthStatus.unknown;
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
