part of 'groups_bloc.dart';

@immutable
sealed class GroupEvent {}

class LoadGroups extends GroupEvent{}

class NewGroup extends GroupEvent{
  final Group group;
  NewGroup({required this.group});

}

class DeleteGroup extends GroupEvent{
  final Group group;
  DeleteGroup({required this.group});
}
