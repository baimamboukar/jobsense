import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jobsense/app/features/auth/domain/models/user_model.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class SignUpEvent extends AuthEvent {
  const SignUpEvent(
      {required this.email, required this.password, required this.user});
  final String email;
  final String password;
  final UserModel user;

  @override
  List<Object?> get props => [email, password, user];
}

class SignInEvent extends AuthEvent {
  const SignInEvent({required this.email, required this.password});
  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

class SignOutEvent extends AuthEvent {}

class AuthCheckEvent extends AuthEvent {}

class AuthLoadingEvent extends AuthEvent {}
