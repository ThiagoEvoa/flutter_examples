import 'package:example/person/model/dao/person_dao.dart';
import 'package:example/person/model/entity/person.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'db_helper.g.dart';

@UseMoor(tables: [Person], daos: [PersonDAO])
class DBHelper extends _$DBHelper {
  DBHelper()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqflite', logStatements: true));

  @override
  int get schemaVersion => 1;
}
