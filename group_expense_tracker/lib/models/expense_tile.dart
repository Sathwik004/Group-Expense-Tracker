//Create a Tile to display in ListView builder
import 'package:flutter/material.dart';
import 'package:group_expense_tracker/models/expense.dart';

class ExpenseTile extends StatelessWidget {
  final Expense expense;
  const ExpenseTile({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              expense.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            Text(expense.amount.toString())
          ],
        ),
      ),
    );
  }
}
