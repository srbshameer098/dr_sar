part of 'hospital_id_bloc.dart';

@immutable
abstract class HospitalIdState {}

class HospitalIdInitial extends HospitalIdState {}

class HospitalLoading extends HospitalIdState {}

class HospitalLoaded extends HospitalIdState {}

class HospitalError extends HospitalIdState {}

class HospitalSearchFound extends HospitalIdState {}

class HospitalSearchNotFound extends HospitalIdState {}
