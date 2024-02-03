part of 'tracker_bloc.dart';

@immutable
sealed class TrackerEvent {}
class LoadExpense extends TrackerEvent{}

class AddExpense extends TrackerEvent{
  final Expense expense;
  AddExpense(this.expense);
}

class RemoveExpense extends TrackerEvent{
  final Expense expense;
  RemoveExpense(this.expense);
}
