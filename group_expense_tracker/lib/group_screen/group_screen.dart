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
        toolbarHeight: 90,
        leadingWidth: 30.0,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondary,
                    image:
                        null, //Add Image over here...............................
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Text(
                group.title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.jpg'), fit: BoxFit.fill),
        ),
        child: BlocBuilder<TrackerBloc, TrackerState>(
          builder: (context, state) {
            
            return state == TrackerInitial? const CircularProgressIndicator(): ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) =>
                  ExpenseTile(expense: expenses[index]),
            );
          },
        ),
      ),
    );
  }
}
