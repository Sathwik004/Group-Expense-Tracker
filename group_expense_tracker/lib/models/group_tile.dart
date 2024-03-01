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
        color: Theme.of(context).colorScheme.onSecondary,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: group.image == null
                  ? Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(10)),
                    )
                  : Image.file(group.image!),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  group.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white, fontSize: 18),
                ),
                Text(
                  'Your Balance ₹${group.balance}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
