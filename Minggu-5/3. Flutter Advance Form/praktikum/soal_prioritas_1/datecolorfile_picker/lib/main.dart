import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:open_file/open_file.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime _dueDate = DateTime.now();
  DateTime currentDate = DateTime.now();
  Color _myColor = Colors.blue;
  XFile? photo;

  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Interactive Widgets"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Builder(builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Date :"),
                    ElevatedButton(
                      onPressed: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: currentDate,
                          firstDate: DateTime(1969),
                          lastDate: DateTime(2069),
                        );

                        if (selectedDate != null) {
                          _dueDate = selectedDate;
                          currentDate = selectedDate;
                          setState(() {});
                        }
                      },
                      child: const Text("Select Date"),
                    ),
                  ],
                ),
                Text(DateFormat('EEEE, dd-MM-yyyy', 'id_ID').format(_dueDate)),
                const SizedBox(height: 40),
                const Text("Color :"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Pick a Color"),
                                content: ColorPicker(
                                  pickerColor: _myColor,
                                  onColorChanged: (value) {
                                    setState(() {
                                      _myColor = value;
                                    });
                                  },
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Save"),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text("Cancel"),
                                  )
                                ],
                              );
                            });
                      },
                      child: const Text("Pick a Color"),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: _myColor,
                        shape: BoxShape.circle,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                const Text("Photo :"),
                const SizedBox(height: 20),
                Builder(builder: (context) {
                  return Row(
                    children: [
                      // photo != null
                      //     ? Image.file(File(photo!.path))
                      //     : const Icon(
                      //         Icons.image,
                      //         size: 100,
                      //       ),
                      Container(
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
                          // image: const DecorationImage(
                          //   image: photo != null ? AssetImage("assets/people_account.png"):FileImage(File(photo!.path),),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                        child: photo != null
                            ? Image.file(
                                File(photo!.path),
                              )
                            : Image.asset(
                                "assets/people_account.png",
                                fit: BoxFit.cover,
                              ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              choosePhoto();
                            },
                            child: const Text("Choose Photo"),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              viewPhoto(photo!);
                            },
                            child: const Text("View Photo"),
                          )
                        ],
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("File Name : ${photo?.name ?? "-"} "),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  void viewPhoto(XFile file) {
    if (photo != null) {
      OpenFile.open(file.path);
    }
    setState(() {});
  }

  void choosePhoto() async {
    final selectedPhoto =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (photo != null) {
      photo = selectedPhoto;
    }
    setState(() {});
  }
}
