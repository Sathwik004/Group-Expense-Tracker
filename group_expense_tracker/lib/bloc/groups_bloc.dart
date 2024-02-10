import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_expense_tracker/data.dart';
import 'package:group_expense_tracker/models/group.dart';

part 'groups_event.dart';
part 'groups_state.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  GroupBloc() : super(GroupInitial()) {
    on<LoadGroups>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 2));
      emit(GroupLoaded(groups: groups));
    });

    on<NewGroup>((event, emit) {
      // create a new group
    });

    on<DeleteGroup>((event, emit) {
      // delete a group
    });
  }
}
