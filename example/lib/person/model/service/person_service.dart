import 'package:chopper/chopper.dart';
import 'package:example/core/util/json_serializable_converter.dart';
import 'package:example/person/model/dto/person_dto.dart';

part 'person_service.chopper.dart';

@ChopperApi()
abstract class PersonService extends ChopperService {
  @Get(path: 'people')
  Future<Response<List<PersonDTO>>> fetch();

  @Post(path: 'person')
  Future<Response> save(@Body() PersonDTO person);

  @Put(path: 'person')
  Future<Response> update(@Body() PersonDTO person);

  @Delete(path: 'person')
  Future<Response> delete(@Body() PersonDTO person);

  static PersonService create() {
    JsonSerializableConverter _converter = JsonSerializableConverter({
      PersonDTO: (jsonData) => PersonDTO.fromJson(jsonData),
    });

    final client = ChopperClient(
      baseUrl: 'https://evoanodebackend.herokuapp.com/api/',
      services: [_$PersonService()],
      converter: _converter,
      errorConverter: _converter,
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );

    return _$PersonService(client);
  }
}
