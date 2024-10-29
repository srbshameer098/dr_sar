part of 'appoinments_bloc_bloc.dart';

@immutable
abstract class AppoinmentsEvent {}

class TakeAppoinmentsEvent extends AppoinmentsEvent {
  final int timeSlotId;
final String reason;
  TakeAppoinmentsEvent(
    this.timeSlotId,
      this.reason,
  );
}
