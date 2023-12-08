import 'dart:io';
import 'package:contact_app/database/contact_database.dart';
import 'package:contact_app/model/contact_model.dart';
import 'package:contact_app/screen/edit_contact/edit_contact_screen.dart';
import 'package:contact_app/utility/utility.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../image/profile_picture_screen.dart';

class EditContactViewModel with ChangeNotifier {
  // Property photo
  String? _photoName;
  String? get photoName => _photoName;

  // Property nama file
  String? _fileName = "";
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
  final _editKey = GlobalKey<FormState>();
  get editKey => _editKey;

  // Method untuk membuka file (open_file)
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
    }
    return null;
  }

  // Method validator nomor
  String? validateNomor(String? value) {
    if (value?.isEmpty == true) {
      return 'Nomor handphone wajib diisi';
    }
    return null;
  }

  void initValue(BuildContext context) {
    _nameController.clear();
    _phoneController.clear();

    final editArguments =
        ModalRoute.of(context)!.settings.arguments as EditContactArguments;

    if ((_nameController.text.isEmpty && _phoneController.text.isEmpty) ==
        true) {
      _nameController.text = editArguments.contactModel.name;
      _phoneController.text = editArguments.contactModel.phone;
      _photoName = editArguments.contactModel.photoName;
      notifyListeners();
    }
  }

  void editContact({
    required int id,
    required BuildContext context,
  }) async {
    final contactModel = await ContactDatabase.instance.readContactDb(id);

    await Navigator.pushNamed(
      context,
      '/edit-page',
      arguments: EditContactArguments(
        contactModel: contactModel,
      ),
    );
    notifyListeners();
  }

  void refreshContacts() async {
    contactList = await ContactDatabase.instance.readAllContactsDb();
    notifyListeners();
  }

// Method navigation balik ke halaman home
  void sendNewEditedContactData(BuildContext context) async {
    if (_editKey.currentState?.validate() == true) {
      final editArguments =
          ModalRoute.of(context)!.settings.arguments as EditContactArguments;

      final editedData = editArguments.contactModel.copy(
        name: _nameController.text,
        phone: _phoneController.text,
        photoName: _photoName,
      );

      await ContactDatabase.instance.updateContactDb(editedData);
      refreshContacts();
      Navigator.pop(context);
    }
  }
}
