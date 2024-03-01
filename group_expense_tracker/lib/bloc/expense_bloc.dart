import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_expense_tracker/data.dart';
import 'package:group_expense_tracker/models/expense.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class TrackerBloc extends Bloc<TrackerEvent, TrackerState> {
  TrackerBloc() : super(TrackerInitial()) {
    on<LoadExpense>((event, emit) async {
      emit(TrackerLoaded(expenses: expenses));
      await Future<void>.delayed(const Duration(seconds: 2));
      
    });

    on<AddExpense>((event, emit) {
      
    });
    on<RemoveExpense>((event, emit) {
      
    });
  }

}
