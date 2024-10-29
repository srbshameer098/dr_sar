import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../../Domain/Models/Doctors/doctors_model.dart';
import '../../../../Infrastructure/Api/Doctors/doctors_api.dart';

part 'doctors_event.dart';

part 'doctors_state.dart';

class DoctorsBloc extends Bloc<DoctorsEvent, DoctorsState> {
  late List<DoctorsModel> doctorsModel;
  DoctorsApi doctorsApi;
  List<DoctorsModel> doctorSearchList = [];

  DoctorsBloc(this.doctorsApi) : super(DoctorsInitial()) {
    on<FetchDoctorsDataEvent>((event, emit) async {
      emit(DoctorsLoading());

      try {
        doctorsModel = await doctorsApi.fetchHospitalsData();
        emit(DoctorsLoaded());
      } catch (e) {
        print("===============+++++++++++++++++++++++++$e");
        print(e==401);
        if (e.toString() == '401') {
          emit(SessionExpired());
        } else {
          emit(DoctorsError());
        }
      }
    });

    on<SearchDoctorEvent>((event, emit) async {
      emit(DoctorsLoading());

      try {
        doctorSearchList = doctorsModel
            .where((element) =>
                element.doctor!.name!.toLowerCase().contains(event.query))
            .toList();
        emit(SearchDoctorDataLoaded());
      } catch (e) {
        print("===============+++++++++++++++++++++++++$e");
        emit(SearchDoctorNotFound());
      }
    });
  }
}
