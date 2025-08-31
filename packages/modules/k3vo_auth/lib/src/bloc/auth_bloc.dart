import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:k3vo_auth/k3vo_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>
    implements IAuthStateProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Stream<AuthState> get authStateStream => stream;

  AuthBloc() : super(AuthInitial()) {
    on<AuthCheckStatusRequested>(_onCheckStatus);
    on<EmailSignInRequested>(_onEmailSignIn);
    on<EmailSignUpRequested>(_onEmailSignUp);
    on<GoogleSignInRequested>(_onGoogleSignIn);
    on<PasswordResetRequested>(_onPasswordReset);
    on<SignOutRequested>(_onSignOut);
  }

  // ---------------- Event Handlers ----------------

  Future<void> _onCheckStatus(
    AuthCheckStatusRequested event,
    Emitter<AuthState> emit,
  ) async {
    final user = _auth.currentUser;
    if (user != null) {
      emit(AuthSuccess(user));
    } else {
      emit(AuthInitial());
    }
  }

  Future<void> _onEmailSignIn(
    EmailSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(AuthSuccess(userCredential.user!));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? "Email login failed"));
    }
  }

  Future<void> _onEmailSignUp(
    EmailSignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(AuthSuccess(userCredential.user!));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? "Signup failed"));
    }
  }

  Future<void> _onGoogleSignIn(
    GoogleSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      if (kIsWeb) {
        // On Web, Firebase handles popup-based Google sign-in
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        final userCredential = await _auth.signInWithPopup(googleProvider);
        emit(AuthSuccess(userCredential.user!));
      } else {
        // Mobile: Android/iOS
        final GoogleSignInAccount? googleUser = await _googleSignIn
            .signIn();
        if (googleUser == null) {
          emit(const AuthFailure("Google sign-in aborted"));
          return;
        }

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        final userCredential = await _auth.signInWithCredential(credential);
        emit(AuthSuccess(userCredential.user!));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? "Google sign-in failed"));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onPasswordReset(
    PasswordResetRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await _auth.sendPasswordResetEmail(email: event.email);
      emit(AuthPasswordResetEmailSent());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? "Password reset failed"));
    }
  }

  Future<void> _onSignOut(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _auth.signOut();
    if (!kIsWeb) {
      await _googleSignIn.signOut();
    }
    emit(AuthInitial());
  }
}
