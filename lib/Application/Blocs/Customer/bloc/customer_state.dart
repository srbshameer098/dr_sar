part of 'customer_bloc.dart';

@immutable
abstract class CustomerState {}

class CustomerInitial extends CustomerState {}

class CustomerLoading extends CustomerState {}

class CustomerLoaded extends CustomerState {}

class CustomerError extends CustomerState {}

class ProfilePicUploading extends CustomerState {}

class ProfilePicUploaded extends CustomerState {}

class ProfilePicNotUploaded extends CustomerState {}
