import 'package:dio/dio.dart';
import 'package:example/post_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import 'post_model.dart';
part 'post_api_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class PostApiService {
  factory PostApiService(Dio dio, {String baseUrl}) = _PostApiService;

  @GET('posts')
  Future<List<PostModel>> fetch();

  @POST('posts')
  Future<HttpResponse> save(@Body() PostModel postModel);

  @PUT('posts/{id}')
  Future<HttpResponse> update(@Body() PostModel postModel, @Path('id') String id);

  @DELETE('posts/{id}')
  Future<HttpResponse> delete(@Body() PostModel postModel);

  static PostApiService create() {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.interceptors.add(PrettyDioLogger());

    return PostApiService(dio);
  }
}
