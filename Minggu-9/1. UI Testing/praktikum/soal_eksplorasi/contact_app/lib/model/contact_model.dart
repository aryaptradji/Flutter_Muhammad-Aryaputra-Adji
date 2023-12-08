import 'dart:convert';

List<ContactModel> contactModelFromJson(String str) => List<ContactModel>.from(
    json.decode(str).map((x) => ContactModel.fromJson(x)));

String contactModelToJson(List<ContactModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

const String contactTable = 'contact_tb';
List<ContactModel> contactList = [];

class ContactModel {
  int? id;
  String name;
  String phone;
  String? photoName;

  ContactModel({
    this.id,
    required this.name,
    required this.phone,
    this.photoName,
  });

  ContactModel copy({
    int? id,
    String? name,
    String? phone,
    String? photoName,
  }) =>
      ContactModel(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        photoName: photoName ?? this.photoName,
      );

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        id: json[ContactFields.id],
        name: json[ContactFields.name],
        phone: json[ContactFields.phone],
        photoName: json[ContactFields.photoName],
      );

  Map<String, dynamic> toJson() => {
        ContactFields.id: id,
        ContactFields.name: name,
        ContactFields.phone: phone,
        ContactFields.photoName: photoName,
      };
}

class ContactFields {
  static final List<String> columns = [
    id,
    name,
    phone,
    photoName,
  ];

  static const String id = '_id';
  static const String name = 'name';
  static const String phone = 'phone';
  static const String photoName = 'photoName';
}
