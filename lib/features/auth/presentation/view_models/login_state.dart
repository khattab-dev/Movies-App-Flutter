import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState {}

class LoginStateInitial extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateFailure extends LoginState {
  LoginStateFailure(String string);
}

class LoginStateSuccess extends LoginState {
  LoginStateSuccess(User? user);
}
