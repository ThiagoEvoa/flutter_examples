import 'package:moor_flutter/moor_flutter.dart';

class Person extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}
