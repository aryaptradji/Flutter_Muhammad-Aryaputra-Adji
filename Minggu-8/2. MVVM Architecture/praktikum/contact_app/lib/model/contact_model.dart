import 'dart:convert';

import 'package:file_picker/file_picker.dart';

List<ContactModel> contactModelFromJson(String str) => List<ContactModel>.from(
    json.decode(str).map((x) => ContactModel.fromJson(x)));

String contactModelToJson(List<ContactModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContactModel {
  int? index;
  int? id;
  String name;
  String phone;
  FilePickerResult? photo;
  String? fileName;

  ContactModel({
    this.index,
    this.id,
    required this.name,
    required this.phone,
    this.photo,
    this.fileName,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
      };
}
