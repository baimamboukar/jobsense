import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsense/app/features/auth/domain/auth_service.dart';
import 'package:jobsense/app/features/auth/domain/hBloc/auth_event.dart';
import 'package:jobsense/app/features/auth/domain/hBloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());
  final AuthService _authService = AuthService();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SignUpEvent) {
      yield* _mapSignUpToState(event);
    } else if (event is SignInEvent) {
      yield* _mapSignInToState(event);
    } else if (event is SignOutEvent) {
      yield* _mapSignOutToState();
    } else if (event is AuthCheckEvent) {
      yield* _mapAuthCheckToState();
    } else if (event is AuthLoadingEvent) {
      yield AuthLoading();
    }
  }

  Stream<AuthState> _mapSignUpToState(SignUpEvent event) async* {
    yield AuthLoading();
    final error = await _authService.signUp(
      email: event.email,
      password: event.password,
      user: event.user,
    );

    if (error == null) {
      yield AuthAuthenticated(
        user: _authService.getCurrentUser(),
        userData: event.user,
      );
    } else {
      yield AuthError(error: error);
    }
  }

  Stream<AuthState> _mapSignInToState(SignInEvent event) async* {
    yield AuthLoading();
    final error =
        await _authService.signIn(email: event.email, password: event.password);

    if (error == null) {
      final userData = await _authService.getUserData();
      yield userData != null
          ? AuthAuthenticated(
              user: _authService.getCurrentUser(),
              userData: userData,
            )
          : AuthError(error: 'Error fetching user data');
    } else {
      yield AuthError(error: error);
    }
  }

  Stream<AuthState> _mapSignOutToState() async* {
    await _authService.signOut();
    yield AuthUnauthenticated();
  }

  Stream<AuthState> _mapAuthCheckToState() async* {
    final user = _authService.getCurrentUser();
    if (user != null) {
      final userData = await _authService.getUserData();
      yield AuthAuthenticated(user: user, userData: userData);
    } else {
      yield AuthUnauthenticated();
    }
  }
}
