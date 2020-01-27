import 'package:moor_flutter/moor_flutter.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 50)();

  DateTimeColumn get dueDate => dateTime().nullable()();

  BoolColumn get completed => boolean().withDefault(Constant(false))();

  TextColumn get taskTypeName =>
      text().nullable().customConstraint('NULL REFERENCES taskTypes(name)')();
}
