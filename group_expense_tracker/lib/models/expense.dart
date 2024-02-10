import 'package:group_expense_tracker/models/user.dart';

class Expense{
  String id;
  String name;
  double amount;
  final List<User> members;

  Expense({required this.id, required this.amount, required this.name, required this.members});
  
}