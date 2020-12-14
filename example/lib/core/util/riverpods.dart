import 'package:example/person/model/service/person_service.dart';
import 'package:example/person/viewmodel/person_viewmodel.dart';
import 'package:flutter_riverpod/all.dart';

final personService = Provider((ref) => PersonService.create());
final personProvider = StateNotifierProvider((ref) => PersonViewModel(ref.watch(personService)));