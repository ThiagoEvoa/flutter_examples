import 'package:chopper/chopper.dart';
import 'package:example/person/model/dto/person_dto.dart';
import 'package:example/person/model/service/person_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/all.dart';

class PersonViewModel extends StateNotifier<List<PersonDTO>> {
  PersonViewModel(this._personService) : super(null);

  PersonService _personService;
  Response _response;
  List<PersonDTO> _people;
  String _message;

  String get getMessage => _message;
  List<PersonDTO> get getPeople => _people;

  Future<void> fetchPeople() async {
    _response = await _personService.fetch();

    if (_response.statusCode == 200) {
      state = _response.body;
    } else {
      _message = 'Something went wrong.';
    }
  }

  savePerson({@required PersonDTO person}) async {
    if (person.id == null) {
      _response = await _personService.save(person);
    } else {
      _response = await _personService.update(person);
    }

    if (_response.statusCode == 200) {
      _message = 'Person saved.';
      fetchPeople();
    } else {
      _message = 'Something went wrong.';
    }
  }

  deletePerson({@required PersonDTO person}) async {
    _response = await _personService.delete(person);

    if (_response.statusCode == 200) {
      _message = 'Person deleted.';
      fetchPeople();
    } else {
      _message = 'Something went wrong.';
    }
  }
}
