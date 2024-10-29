part of 'sos_bloc.dart';

@immutable
abstract class SosEvent {}

class CallSos extends SosEvent{
  final String latitude;
  final String longitude;
  final String landMark;

  CallSos(this.latitude, this.longitude, this.landMark);
}