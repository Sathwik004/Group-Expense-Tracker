import 'package:group_expense_tracker/models/expense.dart';
import 'package:group_expense_tracker/models/group.dart';

final List<Group> groups = [
  Group(id: '001', title: 'Group 01', balance: 2000.0),
  Group(id: '002', title: 'Group 02', balance: 100.0),
  Group(id: '003', title: 'Group 03', balance: -400.0),
];
final List<Expense> expenses = [
  Expense(id: '00.1', amount: 500, name: 'Food',members: []),
  Expense(id: '00.2', amount: 1000, name: 'Fuel',members: []),
  Expense(id: '00.3', amount: 999, name: 'Clothes',members: []),
  Expense(id: '00.4', amount: 620, name: 'Food',members: []),
];
