part of 'appoinments_bloc_bloc.dart';

@immutable
abstract class AppoinmentsState {}

class AppoinmentsBlocInitial extends AppoinmentsState {}

class TakeAppoinmentLaoding extends AppoinmentsState {}

class TakeAppoinmentSuccessfull extends AppoinmentsState {}

class AppoinmentFailed extends AppoinmentsState {}