part of 'hospital_id_bloc.dart';

@immutable
abstract class HospitalIdEvent {}

class FetchHospitalIDDataEvent extends HospitalIdEvent {
  final int hospitalId;

  FetchHospitalIDDataEvent(this.hospitalId);
}

class FetchHospitalRoomsEvent extends HospitalIdEvent {
  final int hospitalId;

  FetchHospitalRoomsEvent(this.hospitalId);
}

class FetchHospitalDoctorsEvent extends HospitalIdEvent {
  final int hospitalId;

  FetchHospitalDoctorsEvent(this.hospitalId);
}

class SearchHospitalDepartmentEvent extends HospitalIdEvent {
  final String query;

  SearchHospitalDepartmentEvent(this.query);
}

class SearchHospitalDoctorEvent extends HospitalIdEvent {
  final String query;

  SearchHospitalDoctorEvent(this.query);
}

class SearchHospitalRoomsEvent extends HospitalIdEvent {
  final String query;

  SearchHospitalRoomsEvent(this.query);
}
