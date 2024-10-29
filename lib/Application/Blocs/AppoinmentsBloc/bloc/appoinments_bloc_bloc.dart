import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../../Domain/Models/AppoinmentsTable/appoinments_table_model.dart';
import '../../../../Infrastructure/Api/AppoinmentsApi/appoinments_api.dart';

part 'appoinments_bloc_event.dart';

part 'appoinments_bloc_state.dart';

class AppoinmentsBloc extends Bloc<AppoinmentsEvent, AppoinmentsState> {
  late AppoinmentsModel appoinmentsModel;
  AppoinmentsApi appoinmentsApi;

  AppoinmentsBloc(this.appoinmentsApi) : super(AppoinmentsBlocInitial()) {
    on<TakeAppoinmentsEvent>((event, emit) async {
      emit(TakeAppoinmentLaoding());
      try {
        appoinmentsModel = await appoinmentsApi.createAppoinments(
            event.timeSlotId.toString(), event.reason);
        emit(TakeAppoinmentSuccessfull());
      } catch (e) {
        emit(AppoinmentFailed());
      }
    });
  }
}
