import 'package:crowwn/features/groups/domain/group.dart';

abstract class GroupRepository {
  Future<List<Group>> getGroups();
}
