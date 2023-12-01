import 'package:dio/dio.dart';

class DiceBearServices {
  static Future<T> getDiceBear<T>({required String avatarName}) async {
    late T diceBearModel;

    final response = await Dio()
        .get('https://api.dicebear.com/7.x/thumbs/svg?see=$avatarName');

    if (response.statusCode == 200) {
      diceBearModel = response.data;
    }
    return diceBearModel;
  }
}
