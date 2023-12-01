import 'dart:convert';

JsonPlaceholderModel jsonPlaceholderModelFromJson(String str) =>
    JsonPlaceholderModel.fromJson(json.decode(str));

String jsonPlaceholderModelToJson(JsonPlaceholderModel data) =>
    json.encode(data.toJson());

class JsonPlaceholderModel {
  int id;
  String title;
  String body;
  int userId;

  JsonPlaceholderModel({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory JsonPlaceholderModel.fromJson(Map<String, dynamic> json) =>
      JsonPlaceholderModel(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "userId": userId,
      };
}
