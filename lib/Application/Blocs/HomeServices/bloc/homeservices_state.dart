part of 'homeservices_bloc.dart';

@immutable
abstract class HomeservicesState {}

class HomeservicesInitial extends HomeservicesState {}

class HomeservicesLoading extends HomeservicesState {}

class HomeservicesLoaded extends HomeservicesState {}

class HomeservicesError extends HomeservicesState {}