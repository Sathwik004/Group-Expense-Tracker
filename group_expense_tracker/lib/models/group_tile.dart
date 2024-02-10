import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_expense_tracker/bloc/expense_bloc.dart';
import 'package:group_expense_tracker/group_screen/group_screen.dart';
import 'package:group_expense_tracker/models/group.dart';

class GroupTile extends StatelessWidget {
  final Group group;

  const GroupTile({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => TrackerBloc(),
              child: GroupScreen(group: group),
            ),
          ),
        );
      },
      child: Card(
        child: Row(
          children: [
            group.image == null
                ? const SizedBox(
                    height: 50,
                    width: 50,
                  )
                : Image.file(group.image!),
            Column(
              children: [
                Text(
                  group.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(group.body)
              ],
            )
          ],
        ),
      ),
    );
  }
}
