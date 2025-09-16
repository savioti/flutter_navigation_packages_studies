import 'package:chopper/chopper.dart';

part 'posts_api_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostsApiService extends ChopperService {
  static PostsApiService create() {
    final client = ChopperClient(
      // The first part of the URL is now here
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [
        // The generated implementation
        _$PostsApiService(),
      ],
      // Converts data to & from JSON and adds the application/json header.
      converter: const JsonConverter(),
    );

    // The generated class with the ChopperClient passed in
    return _$PostsApiService(client);
  }

  @Get(path: '/{id}')
  Future<Response> getPost(@Path('id') int id);

  @Get()
  Future<Response> getPosts();

  @Post()
  Future<Response> postPost(
    @Body() Map<String, dynamic> body,
  );
}
