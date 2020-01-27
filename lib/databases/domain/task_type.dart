import 'package:moor_flutter/moor_flutter.dart';

class TaskTypes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 25)();
  TextColumn get image => text().withLength(min: 1, max: 40)();
  IntColumn get colorCode => integer()();
}
