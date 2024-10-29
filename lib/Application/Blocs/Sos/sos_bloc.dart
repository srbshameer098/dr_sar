import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../../Infrastructure/Api/Sos/sos_api.dart';

part 'sos_event.dart';

part 'sos_state.dart';

class SosBloc extends Bloc<SosEvent, SosState> {
  SosApi sosApi;
  SosBloc(this.sosApi) : super(SosInitial()) {
    on<CallSos>((event, emit) async {
      emit(SosCalling());
      try {
        Response response =
            await sosApi.sos(long: event.longitude, lat: event.latitude,landmark: event.landMark);
        emit(SosCalled());
      } catch (e) {
        print(e);
        emit(SosCallFailed());
      }
    });
  }
}
