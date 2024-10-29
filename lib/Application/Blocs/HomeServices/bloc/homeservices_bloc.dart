import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../../Domain/Models/HomeServices/home_services.dart';
import '../../../../Infrastructure/Api/HomeServices/homeservices_api.dart';
part 'homeservices_event.dart';
part 'homeservices_state.dart';

class HomeservicesBloc extends Bloc<HomeservicesEvent, HomeservicesState> {
  late List<HomeServicesModel> homeServicesModel;
  HomeServicesApi homeServicesApi;

  HomeservicesBloc(this.homeServicesApi) : super(HomeservicesInitial()) {
    on<FetchHomeServicesData>((event, emit) async {
      emit(HomeservicesLoading());
      try {
        homeServicesModel = await homeServicesApi.fetchHomeService();
        emit(HomeservicesLoaded());
      } catch (e) {
        print("===========================$e");
        emit(HomeservicesLoaded());
      }
    });
  }
}
