import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import '../model/contact_model.dart';
import '../widget/color_picker_widget.dart';
import '../widget/date_picker_widget.dart';
import '../widget/text_form_field_widget.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  FilePickerResult? photo;
  String namaFile = "";

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  DateTime _currentDate = DateTime.now();

  Color _myColor = Colors.blue;

  final addKey = GlobalKey<FormState>();

  void viewPhoto(PlatformFile file) {
    if (photo != null) {
      OpenFile.open(file.path);
    }
    setState(() {});
  }

  void choosePhoto() async {
    FilePickerResult? selectedPhoto =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (selectedPhoto != null) {
      photo = selectedPhoto;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Add Contact"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: addKey,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[50],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[400]!,
                              offset: const Offset(0, 10),
                              blurRadius: 40,
                              spreadRadius: 1,
                            ),
                          ],
                          image: DecorationImage(
                            image: photo != null
                                ? FileImage(
                                    File(photo?.paths.first ?? ""),
                                  )
                                : const AssetImage("assets/people_account.png")
                                    as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              choosePhoto();
                            },
                            child: const Text("Choose Photo"),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              viewPhoto(photo!.files.first);
                            },
                            child: const Text("View"),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {
                              photo = null;
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red[50],
                                foregroundColor: Colors.red),
                            child: const Text("Delete"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 20),
                    child:
                        Text("File Name : ${photo?.files.first.name ?? "-"} "),
                  ),
                ],
              ),
              TextFormFieldWidget(
                controller: _nameController,
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return 'Nama wajib diisi';
                  } else if (!RegExp(r'^([a-zA-Z\.]+ ?)+$').hasMatch(value!)) {
                    return 'Nama tidak boleh mengandung angka atau karakter khusus';
                  } else if (!RegExp(r'^([A-Z]{1}[a-z]*\.? ?)+$')
                      .hasMatch(value)) {
                    return 'Tiap kata dari nama harus diawali dengan Huruf Kapital';
                  } else if (!RegExp(r'^([a-zA-Z]+\.? {1})+([a-zA-Z]+\.? ?)+$')
                      .hasMatch(value)) {
                    return 'Nama minimal terdiri dari 2 kata';
                  }
                  return null;
                },
                labelText: 'Name',
                hintText: 'Insert Your Name',
              ),
              const SizedBox(height: 16),
              TextFormFieldWidget(
                controller: _phoneController,
                validator: (value) {
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
                },
                labelText: 'Nomor',
                hintText: '+62 ...',
              ),
              const SizedBox(height: 16),
              DatePickerWidget(
                chooseDate: _currentDate,
                onPressed: () async {
                  final chosenDate = await showDatePicker(
                    context: context,
                    initialDate: _currentDate,
                    firstDate: DateTime(1969),
                    lastDate: DateTime(2069),
                  );

                  if (chosenDate != null) {
                    _currentDate = chosenDate;
                    setState(() {});
                  }
                },
              ),
              const SizedBox(height: 25),
              ColorPickerWidget(
                myColor: _myColor,
                onColorChanged: (color) {
                  setState(() {
                    _myColor = color;
                  });
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white),
                onPressed: () {
                  if (addKey.currentState?.validate() == true) {
                    Navigator.pop(
                      context,
                      ContactModel(
                        name: _nameController.text,
                        nomor: _phoneController.text,
                        currentDate: _currentDate,
                        myColor: _myColor,
                        photo: photo,
                        namaFile: photo?.files.first.name,
                      ),
                    );
                    setState(() {});
                  }
                  print("""Tambah kontak baru berhasil!
=======Data Kontak========
Nama: ${_nameController.text}
Nomor: ${_phoneController.text}
Date: $_currentDate
Color: $_myColor
Nama File: ${photo?.files.first.name}
                  """);
                },
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
