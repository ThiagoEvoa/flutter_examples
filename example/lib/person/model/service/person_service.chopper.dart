// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$PersonService extends PersonService {
  _$PersonService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PersonService;

  @override
  Future<Response<List<PersonDTO>>> fetch() {
    final $url = 'people';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<PersonDTO>, PersonDTO>($request);
  }

  @override
  Future<Response<dynamic>> save(PersonDTO person) {
    final $url = 'person';
    final $body = person;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> update(PersonDTO person) {
    final $url = 'person';
    final $body = person;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> delete(PersonDTO person) {
    final $url = 'person';
    final $body = person;
    final $request = Request('DELETE', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
