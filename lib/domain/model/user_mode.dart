import 'package:drift/drift.dart';

class User extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text()();
  TextColumn get apellidos => text()();
  IntColumn get edad => integer()();
  TextColumn get estado => text()();
  TextColumn get ciudad => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
