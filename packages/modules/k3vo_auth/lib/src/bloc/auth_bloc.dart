import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ---------- EVENTS ----------
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class EmailSignInRequested extends AuthEvent {
  final String email;
  final String password;
  const EmailSignInRequested(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class EmailSignUpRequested extends AuthEvent {
  final String email;
  final String password;
  const EmailSignUpRequested(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class GoogleSignInRequested extends AuthEvent {}

class PasswordResetRequested extends AuthEvent {
  final String email;
  const PasswordResetRequested(this.email);

  @override
  List<Object?> get props => [email];
}

class SignOutRequested extends AuthEvent {}

// ---------- STATES ----------
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}

// ---------- BLOC ----------
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthBloc() : super(AuthInitial()) {
    on<EmailSignInRequested>(_signIn);
    on<EmailSignUpRequested>(_signUp);
    on<GoogleSignInRequested>(_googleSignIn);
    on<PasswordResetRequested>(_passwordReset);
    on<SignOutRequested>(_signOut);
  }

  Future<void> _signIn(
      EmailSignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _auth.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? "Login failed"));
    }
  }

  Future<void> _signUp(
      EmailSignUpRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _auth.createUserWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? "Signup failed"));
    }
  }

  Future<void> _googleSignIn(
      GoogleSignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      // Example with google_sign_in package
      // TODO: Implement actual Google sign-in logic
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _passwordReset(
      PasswordResetRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _auth.sendPasswordResetEmail(email: event.email);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? "Password reset failed"));
    }
  }

  Future<void> _signOut(SignOutRequested event, Emitter<AuthState> emit) async {
    await _auth.signOut();
    emit(AuthInitial());
  }
}
