import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_expense_tracker/bloc/tracker_bloc.dart';
import 'package:group_expense_tracker/models/expense.dart';
import 'package:group_expense_tracker/models/expense_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home Page',
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.logout))
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () => context.read<TrackerBloc>().add(AddExpense(Expense(id: '1234', amount: 100, name: 'Sammuka chaddi'))),
                icon: const Icon(Icons.add)),
            IconButton(
                onPressed: () => context.read<TrackerBloc>().add(RemoveExpense(Expense(id: '1234', amount: 100, name: 'Sammuka chaddi'))),
                icon: const Icon(Icons.minimize))
          ],
        ),
        body: Center(
          child: BlocBuilder<TrackerBloc, TrackerState>(
            builder: (context, state) {
              if (state is TrackerInitial)
              {
                return const CircularProgressIndicator();
              }
              if(state is TrackerLoaded)
              {
                return ListView.builder(
                  itemCount: state.expenses.length,
                  itemBuilder: (context, index) => ExpenseTile(expense: state.expenses[index] as Expense),);
              }
              return const Text('Oops, something went wrong');
              
            },
          ),
        ));
  }
}
