import 'package:chopper/chopper.dart';
import 'package:example/json_serializable_converter.dart';
import 'package:example/post_model.dart';
part 'post_api_service.chopper.dart';

@ChopperApi()
abstract class PostApiService extends ChopperService {
  @Get()
  Future<Response<List<PostModel>>> fetch();

  @Post()
  Future<Response> save(@Body() PostModel postModel);

  @Put(path: '/{id}')
  Future<Response> update(@Body() PostModel postModel, @Path('id') String id);

  @Delete(path: '/{id}')
  Future<Response> delete(@Body() PostModel postModel);

  static PostApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com/posts',
      services: [_$PostApiService()],
      converter: JsonSerializableConverter({
        PostModel: (jsonData) => PostModel.fromJson(jsonData),
      }),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );
    return _$PostApiService(client);
  }
}

//JsonTypeConverter({PostModel: (jsonData) => PostModel.fromJson(jsonData)}),
