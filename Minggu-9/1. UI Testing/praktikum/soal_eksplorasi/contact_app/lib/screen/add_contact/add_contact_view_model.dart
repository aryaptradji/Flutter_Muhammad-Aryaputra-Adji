import 'dart:io';

import 'package:contact_app/database/contact_database.dart';
import 'package:contact_app/model/contact_model.dart';
import 'package:contact_app/screen/image/profile_picture_screen.dart';
import 'package:contact_app/utility/utility.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AddContactViewModel with ChangeNotifier {
  // Property photo
  String? _photoName;
  String? get photoName => _photoName;

  // Property controller textfield nama
  final _nameController = TextEditingController();
  get nameController => _nameController;

  // Property controller textfield nomor
  final _phoneController = TextEditingController();
  get phoneController => _phoneController;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  // Property formkey
  final _addKey = GlobalKey<FormState>();
  get addKey => _addKey;

  // Method untuk melihat profile picture
  void viewPhoto(BuildContext context) {
    if (_photoName != null) {
      Navigator.pushNamed(
        context,
        '/pp-page',
        arguments: ProfilePictureArguments(
          contactModel: ContactModel(
            name: _nameController.text,
            phone: _phoneController.text,
            photoName: _photoName,
          ),
        ),
      );
      notifyListeners();
    }
  }

  // Method untuk memilih file foto (file_picker)
  void choosePhoto() async {
    FilePickerResult? selectedPhoto =
        await FilePicker.platform.pickFiles(type: FileType.image);

    File file = File(selectedPhoto!.files.single.path!);

    if (selectedPhoto != null) {
      _photoName = Utility.base64String(await file.readAsBytes());
    }
    notifyListeners();
  }

  // Method untuk menghapus file foto
  void removePhoto() {
    _photoName = null;
    notifyListeners();
  }

  // Method validator name
  String? validateName(String? value) {
    if (value?.isEmpty == true) {
      return 'Nama wajib diisi';
    } else if (!RegExp(r'^([a-zA-Z\.]+ ?)+$').hasMatch(value!)) {
      return 'Nama tidak boleh mengandung angka atau karakter khusus';
    } else if (!RegExp(r'^([A-Z]{1}[a-z]*\.? ?)+$').hasMatch(value)) {
      return 'Tiap kata dari nama harus diawali dengan Huruf Kapital';
    } else if (!RegExp(r'^([a-zA-Z]+\.? {1})+([a-zA-Z]+\.? ?)+$')
        .hasMatch(value)) {
      return 'Nama minimal terdiri dari 2 kata';
    }
    return null;
  }

  // Method validator nomor
  String? validateNomor(String? value) {
    if (value?.isEmpty == true) {
      return 'Nomor handphone wajib diisi';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
      return 'Nomor handphone harus terdiri dari angka';
    } else if (!RegExp(r'^0+[0-9]+$').hasMatch(value)) {
      return 'Nomor handphone harus dimulai dengan angka 0';
    } else if (!RegExp(r'^([0-9]{8,15})+$').hasMatch(value)) {
      return 'Panjang nomor handphone terdiri dari 8-15 digit';
    }
    return null;
  }

  // Method navigation balik ke halaman home
  void addNewContact(BuildContext context) async {
    if (_addKey.currentState?.validate() == true) {
      final addData = ContactModel(
        name: _nameController.text,
        phone: _phoneController.text,
        photoName: _photoName,
      );

      await ContactDatabase.instance.createContactDb(addData);
      Navigator.pop(context);

      _nameController.clear();
      _phoneController.clear();
      removePhoto();
    }
  }
}
