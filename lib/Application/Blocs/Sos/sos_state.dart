part of 'sos_bloc.dart';

@immutable
abstract class SosState {}

class SosInitial extends SosState {}

class SosCalling extends SosState {}

class SosCalled extends SosState {}

class SosCallFailed extends SosState {}
