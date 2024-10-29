part of 'hospitals_bloc.dart';

@immutable
abstract class HospitalsEvent {}

class FetchHospitalDataEvent extends HospitalsEvent {}

class SearchHospitalEvent extends HospitalsEvent {
  final String query;

  SearchHospitalEvent(this.query);
}
