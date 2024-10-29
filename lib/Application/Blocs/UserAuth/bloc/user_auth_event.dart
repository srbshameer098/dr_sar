part of 'user_auth_bloc.dart';

@immutable
abstract class UserAuthEvent {}

class UserAuthenticationEvent extends UserAuthEvent {
  final String phoneNumber;
  final BuildContext context;
  final String name;
  final String email;
  final String city;
  final String dob;
  final String gender;
  final String healthIssues;

  UserAuthenticationEvent(
    this.phoneNumber,
    this.context,
    this.name,
    this.email,
    this.city,
    this.dob,
    this.gender,
    this.healthIssues,
  );
}

class UserEditEvent extends UserAuthEvent {
  final String phoneNumber;
  final BuildContext context;
  final String name;
  final String email;
  final String city;
  final String dob;
  final String gender;
  final String healthIssues;

  UserEditEvent(
    this.phoneNumber,
    this.context,
    this.name,
    this.email,
    this.city,
    this.dob,
    this.gender,
    this.healthIssues,
  );
}
