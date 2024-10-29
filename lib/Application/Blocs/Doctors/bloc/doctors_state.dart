part of 'doctors_bloc.dart';

@immutable
abstract class DoctorsState {}

class DoctorsInitial extends DoctorsState {}

class DoctorsLoading extends DoctorsState {}

class DoctorsLoaded extends DoctorsState {}

class DoctorsError extends DoctorsState {}

class SessionExpired extends DoctorsState {}

class SearchDoctorDataLoaded extends DoctorsState {}

class SearchDoctorNotFound extends DoctorsState {}