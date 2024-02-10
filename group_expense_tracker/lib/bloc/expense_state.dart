part of 'expense_bloc.dart';

@immutable
sealed class TrackerState {}

final class TrackerInitial extends TrackerState {}

class TrackerLoaded extends TrackerState{
  final List<Expense> expenses;
  TrackerLoaded({required this.expenses});
}
