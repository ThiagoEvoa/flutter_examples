import 'package:moor_flutter/moor_flutter.dart';

class Person extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}
