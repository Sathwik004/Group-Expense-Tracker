import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_expense_tracker/bloc/expense_bloc.dart';
import 'package:group_expense_tracker/data.dart';
import 'package:group_expense_tracker/models/expense_tile.dart';
import 'package:group_expense_tracker/models/group.dart';

class GroupScreen extends StatelessWidget {
  final Group group;
  const GroupScreen({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            group.title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
      ),
      body: BlocBuilder<TrackerBloc, TrackerState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) =>
                ExpenseTile(expense: expenses[index]),
          );
        },
      ),
    );
  }
}
