// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String name;
  final DateTime dueDate;
  final bool completed;
  final String taskTypeName;
  Task(
      {@required this.id,
      @required this.name,
      this.dueDate,
      @required this.completed,
      this.taskTypeName});
  factory Task.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Task(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      dueDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}due_date']),
      completed:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}completed']),
      taskTypeName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}task_type_name']),
    );
  }
  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Task(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
      completed: serializer.fromJson<bool>(json['completed']),
      taskTypeName: serializer.fromJson<String>(json['taskTypeName']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'dueDate': serializer.toJson<DateTime>(dueDate),
      'completed': serializer.toJson<bool>(completed),
      'taskTypeName': serializer.toJson<String>(taskTypeName),
    };
  }

  @override
  TasksCompanion createCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      completed: completed == null && nullToAbsent
          ? const Value.absent()
          : Value(completed),
      taskTypeName: taskTypeName == null && nullToAbsent
          ? const Value.absent()
          : Value(taskTypeName),
    );
  }

  Task copyWith(
          {int id,
          String name,
          DateTime dueDate,
          bool completed,
          String taskTypeName}) =>
      Task(
        id: id ?? this.id,
        name: name ?? this.name,
        dueDate: dueDate ?? this.dueDate,
        completed: completed ?? this.completed,
        taskTypeName: taskTypeName ?? this.taskTypeName,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dueDate: $dueDate, ')
          ..write('completed: $completed, ')
          ..write('taskTypeName: $taskTypeName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(dueDate.hashCode,
              $mrjc(completed.hashCode, taskTypeName.hashCode)))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.name == this.name &&
          other.dueDate == this.dueDate &&
          other.completed == this.completed &&
          other.taskTypeName == this.taskTypeName);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> dueDate;
  final Value<bool> completed;
  final Value<String> taskTypeName;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.completed = const Value.absent(),
    this.taskTypeName = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.dueDate = const Value.absent(),
    this.completed = const Value.absent(),
    this.taskTypeName = const Value.absent(),
  }) : name = Value(name);
  TasksCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<DateTime> dueDate,
      Value<bool> completed,
      Value<String> taskTypeName}) {
    return TasksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      completed: completed ?? this.completed,
      taskTypeName: taskTypeName ?? this.taskTypeName,
    );
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  final GeneratedDatabase _db;
  final String _alias;
  $TasksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _dueDateMeta = const VerificationMeta('dueDate');
  GeneratedDateTimeColumn _dueDate;
  @override
  GeneratedDateTimeColumn get dueDate => _dueDate ??= _constructDueDate();
  GeneratedDateTimeColumn _constructDueDate() {
    return GeneratedDateTimeColumn(
      'due_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _completedMeta = const VerificationMeta('completed');
  GeneratedBoolColumn _completed;
  @override
  GeneratedBoolColumn get completed => _completed ??= _constructCompleted();
  GeneratedBoolColumn _constructCompleted() {
    return GeneratedBoolColumn('completed', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _taskTypeNameMeta =
      const VerificationMeta('taskTypeName');
  GeneratedTextColumn _taskTypeName;
  @override
  GeneratedTextColumn get taskTypeName =>
      _taskTypeName ??= _constructTaskTypeName();
  GeneratedTextColumn _constructTaskTypeName() {
    return GeneratedTextColumn('task_type_name', $tableName, true,
        $customConstraints: 'NULL REFERENCES taskTypes(name)');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, dueDate, completed, taskTypeName];
  @override
  $TasksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tasks';
  @override
  final String actualTableName = 'tasks';
  @override
  VerificationContext validateIntegrity(TasksCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.dueDate.present) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableValue(d.dueDate.value, _dueDateMeta));
    } else if (dueDate.isRequired && isInserting) {
      context.missing(_dueDateMeta);
    }
    if (d.completed.present) {
      context.handle(_completedMeta,
          completed.isAcceptableValue(d.completed.value, _completedMeta));
    } else if (completed.isRequired && isInserting) {
      context.missing(_completedMeta);
    }
    if (d.taskTypeName.present) {
      context.handle(
          _taskTypeNameMeta,
          taskTypeName.isAcceptableValue(
              d.taskTypeName.value, _taskTypeNameMeta));
    } else if (taskTypeName.isRequired && isInserting) {
      context.missing(_taskTypeNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Task.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TasksCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.dueDate.present) {
      map['due_date'] = Variable<DateTime, DateTimeType>(d.dueDate.value);
    }
    if (d.completed.present) {
      map['completed'] = Variable<bool, BoolType>(d.completed.value);
    }
    if (d.taskTypeName.present) {
      map['task_type_name'] =
          Variable<String, StringType>(d.taskTypeName.value);
    }
    return map;
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(_db, alias);
  }
}

class TaskType extends DataClass implements Insertable<TaskType> {
  final int id;
  final String name;
  final String image;
  final int colorCode;
  TaskType(
      {@required this.id,
      @required this.name,
      @required this.image,
      @required this.colorCode});
  factory TaskType.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return TaskType(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
      colorCode:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}color_code']),
    );
  }
  factory TaskType.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return TaskType(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
      colorCode: serializer.fromJson<int>(json['colorCode']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
      'colorCode': serializer.toJson<int>(colorCode),
    };
  }

  @override
  TaskTypesCompanion createCompanion(bool nullToAbsent) {
    return TaskTypesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      colorCode: colorCode == null && nullToAbsent
          ? const Value.absent()
          : Value(colorCode),
    );
  }

  TaskType copyWith({int id, String name, String image, int colorCode}) =>
      TaskType(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        colorCode: colorCode ?? this.colorCode,
      );
  @override
  String toString() {
    return (StringBuffer('TaskType(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('colorCode: $colorCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(name.hashCode, $mrjc(image.hashCode, colorCode.hashCode))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is TaskType &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image &&
          other.colorCode == this.colorCode);
}

class TaskTypesCompanion extends UpdateCompanion<TaskType> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> image;
  final Value<int> colorCode;
  const TaskTypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.colorCode = const Value.absent(),
  });
  TaskTypesCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String image,
    @required int colorCode,
  })  : name = Value(name),
        image = Value(image),
        colorCode = Value(colorCode);
  TaskTypesCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> image,
      Value<int> colorCode}) {
    return TaskTypesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      colorCode: colorCode ?? this.colorCode,
    );
  }
}

class $TaskTypesTable extends TaskTypes
    with TableInfo<$TaskTypesTable, TaskType> {
  final GeneratedDatabase _db;
  final String _alias;
  $TaskTypesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 25);
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedTextColumn _image;
  @override
  GeneratedTextColumn get image => _image ??= _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn('image', $tableName, false,
        minTextLength: 1, maxTextLength: 40);
  }

  final VerificationMeta _colorCodeMeta = const VerificationMeta('colorCode');
  GeneratedIntColumn _colorCode;
  @override
  GeneratedIntColumn get colorCode => _colorCode ??= _constructColorCode();
  GeneratedIntColumn _constructColorCode() {
    return GeneratedIntColumn(
      'color_code',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, image, colorCode];
  @override
  $TaskTypesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'task_types';
  @override
  final String actualTableName = 'task_types';
  @override
  VerificationContext validateIntegrity(TaskTypesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.image.present) {
      context.handle(
          _imageMeta, image.isAcceptableValue(d.image.value, _imageMeta));
    } else if (image.isRequired && isInserting) {
      context.missing(_imageMeta);
    }
    if (d.colorCode.present) {
      context.handle(_colorCodeMeta,
          colorCode.isAcceptableValue(d.colorCode.value, _colorCodeMeta));
    } else if (colorCode.isRequired && isInserting) {
      context.missing(_colorCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskType map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TaskType.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TaskTypesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.image.present) {
      map['image'] = Variable<String, StringType>(d.image.value);
    }
    if (d.colorCode.present) {
      map['color_code'] = Variable<int, IntType>(d.colorCode.value);
    }
    return map;
  }

  @override
  $TaskTypesTable createAlias(String alias) {
    return $TaskTypesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TasksTable _tasks;
  $TasksTable get tasks => _tasks ??= $TasksTable(this);
  $TaskTypesTable _taskTypes;
  $TaskTypesTable get taskTypes => _taskTypes ??= $TaskTypesTable(this);
  TaskDao _taskDao;
  TaskDao get taskDao => _taskDao ??= TaskDao(this as AppDatabase);
  TaskTypeDao _taskTypeDao;
  TaskTypeDao get taskTypeDao =>
      _taskTypeDao ??= TaskTypeDao(this as AppDatabase);
  @override
  List<TableInfo> get allTables => [tasks, taskTypes];
}
