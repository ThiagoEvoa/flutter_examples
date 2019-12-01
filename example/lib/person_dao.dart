import 'package:example/person.dart';
import 'package:hive/hive.dart';

class PersonDao implements TypeAdapter{
  Box _personBox;

  PersonDao(){
    _personBox = Hive.box('person');
  } 

  Box<dynamic> get() {
    return _personBox;
  }

  insert(Person person) {
    _personBox.add(person);
  }

  update(int index, Person person){
    _personBox.put(index, person);
  }

  delete(int id){
    _personBox.delete(id);
  }

  @override
  read(BinaryReader reader) {
    return null;
  }

  @override
  void write(BinaryWriter writer, obj) {
  }
}
