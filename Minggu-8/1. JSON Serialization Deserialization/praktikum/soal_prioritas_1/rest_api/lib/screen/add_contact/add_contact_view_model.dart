import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:rest_api/model/api/contact_api.dart';
import 'package:rest_api/model/contact_model.dart';

class AddContactViewModel with ChangeNotifier {
  // Property id
  int _id = 0;
  set id(int value) {
    _id = value;
  }

  int get id => _id;

  // Property photo
  FilePickerResult? _photo;
  FilePickerResult? get photo => _photo;

  // Property nama file
  String? _fileName = "-";
  String? get fileName => _fileName;

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

  // Method untuk membuka file (open_file)
  void viewPhoto(PlatformFile file) {
    if (_photo != null) {
      OpenFile.open(file.path);
    }
    notifyListeners();
  }

  // Method untuk memilih file foto (file_picker)
  void choosePhoto() async {
    FilePickerResult? selectedPhoto =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (selectedPhoto != null) {
      _photo = selectedPhoto;
      _fileName = _photo?.files.first.name;
    }
    notifyListeners();
  }

  // Method untuk menghapus file foto
  void removePhoto() {
    _photo = null;
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
  void sendNewContactData(BuildContext context) async {
    if (_addKey.currentState?.validate() == true) {
      try {
        final data = await ContactApi.postContact(
          _nameController.text,
          _phoneController.text,
        );
        data.id = _id;
        data.photo = _photo;
        data.fileName = _fileName;

        // ignore: use_build_context_synchronously
        Navigator.pop(
          context,
          ContactModel(
            id: data.id,
            name: data.name,
            phone: data.phone,
            photo: data.photo,
            fileName: data.fileName,
          ),
        );

        // ignore: avoid_print
        print(data);
        print("""Tambah kontak baru berhasil!
=======Data Kontak========
Id: ${data.id}
Name: ${data.name}
Phone: ${data.phone}
Photo: ${data.photo}
File: ${data.fileName}
                  """);
        _id++;

        _nameController.clear();
        _phoneController.clear();

        final snackBar = SnackBar(
          content: const Text('New contact added!'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        );
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        notifyListeners();
      } on DioException catch (e) {
        if (e.response?.statusCode == 500) {
          final snackBar = SnackBar(
            content: const Text('This people is already in your contact'),
            action: SnackBarAction(
              label: 'CHANGE',
              onPressed: () {},
            ),
          );
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    }
  }
}
