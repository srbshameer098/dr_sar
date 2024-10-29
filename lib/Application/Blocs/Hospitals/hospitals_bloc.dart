import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../Domain/Models/Hospitals/hospitalsmodel.dart';
import '../../../Infrastructure/Api/Hospitals/hospital_api.dart';

part 'hospitals_event.dart';

part 'hospitals_state.dart';

class HospitalsBloc extends Bloc<HospitalsEvent, HospitalsState> {
  late List<HospitalsModel> hospitalsModel;
  HospitalsApi hospitalsApi;
  List<HospitalsModel> searchList = [];

  HospitalsBloc(this.hospitalsApi) : super(HospitalsInitial()) {
    on<FetchHospitalDataEvent>((event, emit) async {
      emit(HospitalsDataLoading());
      try {
        hospitalsModel = await hospitalsApi.fetchHospitalsData();
        emit(HospitalsDataLoaded());
      } catch (e) {
        if (e.toString() == '401') {
          emit(SessionExpired());
        } else {
          emit(HospitalsDataError());
        }
      }
    });
    on<SearchHospitalEvent>((event, emit) async {
      emit(HospitalsDataLoading());
      try {
        searchList = hospitalsModel
            .where((element) =>
                element.name!.toLowerCase().contains(event.query.toLowerCase()))
            .toList();
        print("++++++++++++++++++++++++++${searchList[0].name}+${event.query}");
        emit(SearchHospitalsDataLoaded());
      } catch (e) {
        print("================++++++++++++=Bloc===$e");
        emit(SearchHospitalNotFound());
      }
    });
  }
}
