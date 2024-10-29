import 'package:bloc/bloc.dart';

import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Domain/Models/Customer/customer_model.dart';
import '../../../../Domain/Models/UpdateProfilePic/update_profile_pic.dart';
import '../../../../Infrastructure/Api/Customer/customer_api.dart';

part 'customer_event.dart';

part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  late CustomerModel customerModel;
  late UpdateProfilePic updateProfilePic;
  CustomerApi customerApi;

  CustomerBloc(this.customerApi) : super(CustomerInitial()) {
    on<FetchCustomerDataEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      emit(CustomerLoading());

      try {
        customerModel = await customerApi.fetchCustomerData();
        prefs.setInt('userId', customerModel.customer!.id!);
        prefs.setString('name', customerModel.customer!.name!);
        prefs.setString('phone', customerModel.customer!.phone!);
        prefs.setString('city', customerModel.customer!.city!);
        emit(CustomerLoaded());
      } catch (e) {
        emit(CustomerError());
      }
    });

    on<UploadProfilePic>((event, emit) async {
      emit(CustomerLoading());
      try {
        updateProfilePic = await customerApi.uploadFunction(event.pickedFile,event.imgId);
        emit(CustomerLoaded());
      } catch (e) {
        emit(CustomerError());
      }
    });
  }
}
