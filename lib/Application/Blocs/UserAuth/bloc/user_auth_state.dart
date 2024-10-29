part of 'user_auth_bloc.dart';

@immutable
abstract class UserAuthState {}

class UserAuthInitial extends UserAuthState {}

class UserAuthLoading extends UserAuthState {}

class UserAuthSuccess extends UserAuthState {}

class UserAuthFailed extends UserAuthState {}

class ExistingUser extends UserAuthState {}

class ConnectionTimedOut extends UserAuthState {}

class ServerError extends UserAuthState {}
