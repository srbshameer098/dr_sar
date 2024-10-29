part of 'hospitals_bloc.dart';

@immutable
abstract class HospitalsState {}

class HospitalsInitial extends HospitalsState {}

class HospitalsDataLoading extends HospitalsState {}

class HospitalsDataLoaded extends HospitalsState {}

class SearchHospitalsDataLoaded extends HospitalsState {}

class SearchHospitalNotFound extends HospitalsState {}

class HospitalsDataError extends HospitalsState {}

class SessionExpired extends HospitalsState {}
