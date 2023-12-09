part of 'login_bloc.dart';

abstract class LoginEvent {}

class CredentialsChecked extends LoginEvent {
  final String email;
  final String password;

  CredentialsChecked({required this.email, required this.password});
}

class UserAuthorized extends LoginEvent {
  final String email;
  final String password;

  UserAuthorized({required this.email, required this.password});
}

class PasswordShowed extends LoginEvent {
  PasswordShowed();
}

class UserSignedOut extends LoginEvent {
  UserSignedOut();
}
