// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:file_picker/file_picker.dart';

class ContactModel {
  int? index;
  String? name;
  String? nomor;
  FilePickerResult? photo;
  String? namaFile;
  DateTime? currentDate;
  Color? myColor;

  ContactModel(
      {this.index,
      this.name,
      this.nomor,
      this.photo,
      this.namaFile,
      this.currentDate,
      this.myColor});
}

List<ContactModel> contactModel = [];
