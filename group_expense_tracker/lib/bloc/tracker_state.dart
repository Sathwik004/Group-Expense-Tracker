part of 'tracker_bloc.dart';

@immutable
sealed class TrackerState {}

final class TrackerInitial extends TrackerState {}

class TrackerLoaded extends TrackerState{
  final List<Object> expenses;
  TrackerLoaded({required this.expenses});
}
