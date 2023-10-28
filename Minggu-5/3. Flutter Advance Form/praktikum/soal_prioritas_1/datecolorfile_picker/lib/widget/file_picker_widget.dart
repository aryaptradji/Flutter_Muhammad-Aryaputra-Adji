import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class FilePickerWidget extends StatefulWidget {
  const FilePickerWidget({super.key});

  @override
  State<FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  FilePickerResult? photo;

  void viewPhoto(PlatformFile file) {
    if (photo != null) {
      OpenFile.open(file.path);
    }
    setState(() {});
  }

  void choosePhoto() async {
    FilePickerResult? selectedPhoto = await FilePicker.platform.pickFiles();

    if (selectedPhoto != null) {
      photo = selectedPhoto;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Photo :"),
        const SizedBox(height: 20),
        Row(
          children: [
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
                    viewPhoto(photo!.files.first);
                  },
                  child: const Text("View Photo"),
                )
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text("File Name : ${photo?.files.first.name ?? "-"} "),
        ),
      ],
    );
  }
}
