import 'package:hive/hive.dart';

@HiveType()
class Person {
  @HiveField(0)
  String name;

  Person({this.name});
}