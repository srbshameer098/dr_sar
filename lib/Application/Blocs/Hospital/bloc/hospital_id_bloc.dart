import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../../Domain/Models/HospitalId/hospital_id_model.dart';
import '../../../../Infrastructure/Api/Hospitals/hospital_api.dart';

part 'hospital_id_event.dart';

part 'hospital_id_state.dart';

class HospitalIdBloc extends Bloc<HospitalIdEvent, HospitalIdState> {
  late HospitalById hospitalById;
  HospitalsApi hospitalsApi;
  List<Departments> departmentSearch = [];
  List<Doctors> hospitalDoctor = [];
  List<Rooms> hospitalRoom = [];

  HospitalIdBloc(this.hospitalsApi) : super(HospitalIdInitial()) {
    on<FetchHospitalIDDataEvent>((event, emit) async {
      emit(HospitalLoading());
      try {
        hospitalById = await hospitalsApi.fetchHospitalDataId(event.hospitalId);
        emit(HospitalLoaded());
      } catch (e) {
        emit(HospitalError());
      }
    });

    on<SearchHospitalDepartmentEvent>((event, emit) async {
      emit(HospitalLoading());
      try {
        departmentSearch = hospitalById.hospital!.departments!
            .where((element) =>
                element.department!.name!.toLowerCase().contains(event.query))
            .toList();
        emit(HospitalSearchFound());
      } catch (e) {
        emit(HospitalSearchNotFound());
      }
    });

    on<SearchHospitalDoctorEvent>((event, emit) async {
      emit(HospitalLoading());
      try {
        hospitalDoctor = hospitalById.hospital!.doctors!
            .where((element) =>
                element.doctor!.name!.toLowerCase().contains(event.query))
            .toList();
        emit(HospitalSearchFound());
      } catch (e) {
        emit(HospitalSearchNotFound());
      }
    });

    on<SearchHospitalRoomsEvent>((event, emit) async {
      emit(HospitalLoading());
      try {
        hospitalRoom = hospitalById.hospital!.rooms!
            .where((element) =>
                element.room!.roomNum!.toLowerCase().contains(event.query))
            .toList();
        emit(HospitalSearchFound());
      } catch (e) {
        emit(HospitalSearchNotFound());
      }
    });
  }
}
