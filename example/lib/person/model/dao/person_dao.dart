import 'package:example/core/util/db_helper.dart';
import 'package:example/person/model/entity/person.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'person_dao.g.dart';

@UseDao(tables: [Person])
class PersonDAO extends DatabaseAccessor<DBHelper> with _$PersonDAOMixin {
  final DBHelper dbHelper;

  PersonDAO(this.dbHelper) : super(dbHelper);

  Future<PersonData> getUser() => select(person).getSingle();
  Future insertUser(Insertable<PersonData> personData) =>
      into(person).insert(personData);
  Future updateUser(Insertable<PersonData> personData) =>
      update(person).replace(personData);
  Future deleteUser(Insertable<PersonData> personData) =>
      delete(person).delete(personData);
}
