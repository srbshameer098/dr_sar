part of 'customer_bloc.dart';

@immutable
abstract class CustomerEvent {}

class FetchCustomerDataEvent extends CustomerEvent {
  FetchCustomerDataEvent();
}

class UploadProfilePic extends CustomerEvent {
  final XFile pickedFile;
  final int imgId;

  UploadProfilePic(this.pickedFile,this.imgId);
}
