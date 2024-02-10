part of 'groups_bloc.dart';

@immutable
sealed class GroupState {}

final class GroupInitial extends GroupState {}

final class GroupLoaded extends GroupState {
  final List<Group> groups;
  GroupLoaded({required this.groups});
}
