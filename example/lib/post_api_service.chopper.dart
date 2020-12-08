// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$PostApiService extends PostApiService {
  _$PostApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PostApiService;

  @override
  Future<Response<List<PostModel>>> fetch() {
    final $url = '';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<PostModel>, PostModel>($request);
  }

  @override
  Future<Response<dynamic>> save(PostModel postModel) {
    final $url = '';
    final $body = postModel;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> update(PostModel postModel, String id) {
    final $url = '/$id';
    final $body = postModel;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> delete(PostModel postModel) {
    final $url = '/{id}';
    final $body = postModel;
    final $request = Request('DELETE', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
