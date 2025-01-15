import 'package:isar/isar.dart';

part 'train.g.dart';

@collection
class Train {
  Id id = Isar.autoIncrement;

  String? name;
  String? type;
  DateTime? date;
  DateTime? duration;
}