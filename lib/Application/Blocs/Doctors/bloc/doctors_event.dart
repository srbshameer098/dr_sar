part of 'doctors_bloc.dart';

@immutable
abstract class DoctorsEvent {}

class FetchDoctorsDataEvent extends DoctorsEvent {}

class SearchDoctorEvent extends DoctorsEvent {
  final String query;

  SearchDoctorEvent(this.query);
}
