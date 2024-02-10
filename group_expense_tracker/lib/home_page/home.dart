import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_expense_tracker/bloc/groups_bloc.dart';
import 'package:group_expense_tracker/models/group.dart';
import 'package:group_expense_tracker/models/group_tile.dart';
import 'package:group_expense_tracker/models/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            'Home Page',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          actions: [
            Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                alignment: Alignment.center,
                child: const CircleAvatar(
                  radius: 20,
                ))
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () => context.read<GroupBloc>().add(NewGroup(
                    group: Group(id: "01", title: "Samarthu", body: "chaddi"))),
                icon: const Icon(Icons.add),),
            IconButton(
                onPressed: () => context.read<GroupBloc>().add(DeleteGroup(
                    group: Group(id: "01", title: "Samarthu", body: "chaddi"))),
                icon: const Icon(Icons.minimize))
          ],
        ),
        drawer: const MyDrawer(),
        body: Center(
          child: BlocBuilder<GroupBloc, GroupState>(
            builder: (context, state) {
              if (state is GroupInitial) {
                return const CircularProgressIndicator();
              }
              if (state is GroupLoaded) {
                return ListView.builder(
                  itemCount: state.groups.length,
                  itemBuilder: (context, index) =>
                      GroupTile(group: state.groups[index]),
                );
              }
              return const Text('Oops, something went wrong');
            },
          ),
        ));
  }
}
