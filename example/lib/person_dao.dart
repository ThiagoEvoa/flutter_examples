import 'package:example/db_helper.dart';
import 'package:example/person.dart';
import 'package:moor_flutter/moor_flutter.dart';
part 'person_dao.g.dart';

@UseDao(tables: [Person])
class PersonDAO extends DatabaseAccessor<DBHelper> with _$PersonDAOMixin {
  final DBHelper dbHelper;

  PersonDAO(this.dbHelper) : super(dbHelper);

  Stream<List<PersonData>> selectAll() => select(person).watch();
  Future insertPerson(Insertable<PersonData> p) => into(person).insert(p);
  Future updatePerson(Insertable<PersonData> p) => update(person).replace(p);
  Future deletePerson(Insertable<PersonData> p) => delete(person).delete(p);
}
