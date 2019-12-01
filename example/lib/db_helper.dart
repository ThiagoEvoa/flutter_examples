import 'package:example/person_dao.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class DBHelper {
  static init() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    await Hive.openBox('person');
    Hive.registerAdapter(PersonDao(), 0);
  }

  static close() {
    Hive.box('person').compact();
    Hive.close();
  }
}
