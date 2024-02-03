import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_expense_tracker/models/expense.dart';

part 'tracker_event.dart';
part 'tracker_state.dart';

class TrackerBloc extends Bloc<TrackerEvent, TrackerState> {
  TrackerBloc() : super(TrackerInitial()) {
    on<LoadExpense>((event, emit) {
      Future<void>.delayed(const Duration(seconds: 1));
      emit(TrackerLoaded(expenses: const []));
    });

    on<AddExpense>((event, emit) {
      if (state is TrackerLoaded) {
        final state = this.state as TrackerLoaded;
        emit(TrackerLoaded(expenses: [...state.expenses, event.expense]));
      }
    });
    on<RemoveExpense>((event, emit) {
      if (state is TrackerLoaded) {
        final state = this.state as TrackerLoaded;
        emit(
          TrackerLoaded(
            expenses: List<Expense>.from(state.expenses)
              ..removeWhere((element) => element.amount == 100),
          ),
        );
      }
    });
  }

}
