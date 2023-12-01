import 'package:dio/dio.dart';
import 'package:rest_api/model/json_placeholder_model.dart';

class JsonPlaceholderApi {
  /// PUT JSON PLACEHOLDER
  static Future<JsonPlaceholderModel> putContact() async {
    late JsonPlaceholderModel jsonPlaceholderModel;

    final response = await Dio().put(
      'https://jsonplaceholder.typicode.com/posts/1',
      data: {
        "id": 1,
        "title": "foo",
        "body": "bar",
        "userId": 1,
      },
    );

    jsonPlaceholderModel = JsonPlaceholderModel.fromJson(response.data);

    return jsonPlaceholderModel;
  }
}
