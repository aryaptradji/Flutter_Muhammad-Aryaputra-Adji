import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

import 'package:rest_api/model/contact_model.dart';
import 'package:rest_api/screen/edit_contact/edit_contact_screen.dart';

import '../../model/api/json_placeholder_api.dart';

class EditContactViewModel with ChangeNotifier {
  // Property photo
  FilePickerResult? _photo;
  FilePickerResult? get photo => _photo;

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
      _photo = editArguments.contactModel.photo;
      _fileName = editArguments.contactModel.fileName ?? "No photo yet.";

      notifyListeners();
    }
  }

  Future sendEditData({
    required ContactModel contactModel,
    required BuildContext context,
  }) async {
    final contactData = await Navigator.pushNamed(
      context,
      '/edit-page',
      arguments: EditContactArguments(
        contactModel: contactModel,
      ),
    );

    return contactData;
  }

// Method navigation balik ke halaman home
  void sendNewEditedContactData(BuildContext context) async {
    try {
      if (_editKey.currentState?.validate() == true) {
        final dataApi = await JsonPlaceholderApi.putContact();
        print(dataApi);
        print('{');
        print('  "id": "${dataApi.id}",');
        print('}');

        final data = ContactModel(
          id: dataApi.id,
          name: dataApi.title,
          phone: dataApi.body,
          photo: _photo,
          fileName: _fileName,
        );
        Navigator.pop(
          context,
          data,
        );
        final snackBar = SnackBar(
          content: const Text('Contact Successfully Changed!'),
          action: SnackBarAction(
            label: 'YAY!',
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      final snackBar = SnackBar(
        content: const Text('Failed to Change Contact:('),
        action: SnackBarAction(label: 'TRY AGAIN', onPressed: () {}),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
