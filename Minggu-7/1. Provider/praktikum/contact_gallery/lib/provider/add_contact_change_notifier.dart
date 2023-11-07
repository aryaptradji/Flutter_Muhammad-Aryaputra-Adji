import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

import '../model/contact_model.dart';

class AddContactChangeNotifier with ChangeNotifier {
  // Property photo
  FilePickerResult? _photo;
  FilePickerResult? get photo => _photo;

  // Property nama file
  final String _namaFile = "";
  String get namaFile => _namaFile;

  // Property controller textfield nama
  final _nameController = TextEditingController();
  get nameController => _nameController;

  // Property controller textfield nomor
  final _phoneController = TextEditingController();
  get phoneController => _phoneController;

  // Property date
  DateTime _currentDate = DateTime.now();
  DateTime get currentDate => _currentDate;

  // Property color
  Color _myColor = Colors.blue;
  Color get myColor => _myColor;

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
    }
    notifyListeners();
  }

  // Method untuk menghapus file foto
  void removePhoto() {
    _photo = null;
    notifyListeners();
  }

  // Method datepicker
  void chooseDate(BuildContext context) async {
    final chosenDate = await showDatePicker(
      context: context,
      initialDate: _currentDate,
      firstDate: DateTime(1969),
      lastDate: DateTime(2069),
    );

    if (chosenDate != null) {
      _currentDate = chosenDate;
      notifyListeners();
    }
  }

  // Method colorpicker (flutter_colorpicker)
  void chooseColor(Color color) {
    _myColor = color;
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
  void navigationHome(BuildContext context) {
    if (_addKey.currentState?.validate() == true) {
      Navigator.pop(
        context,
        ContactModel(
          name: _nameController.text,
          nomor: _phoneController.text,
          currentDate: _currentDate,
          myColor: _myColor,
          photo: _photo,
          namaFile: _photo?.files.first.name,
        ),
      );
      print("""Tambah kontak baru berhasil!
=======Data Kontak========
Nama: ${_nameController.text}
Nomor: ${_phoneController.text}
Date: $_currentDate
Color: $_myColor
Nama File: ${_photo?.files.first.name}
                  """);
      notifyListeners();
    }
  }
}
