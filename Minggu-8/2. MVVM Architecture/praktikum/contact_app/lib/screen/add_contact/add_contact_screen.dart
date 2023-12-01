// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/screen/add_contact/add_contact_view_model.dart';

import '../../widget/text_form_field_widget.dart';

class AddContactScreen extends StatelessWidget {
  const AddContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addContactProvider = Provider.of<AddContactViewModel>(context);

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
          key: addContactProvider.addKey,
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
                            image: addContactProvider.photo != null
                                ? FileImage(
                                    File(
                                        addContactProvider.photo?.paths.first ??
                                            ""),
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
                              addContactProvider.choosePhoto();
                            },
                            child: const Text("Choose Photo"),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              addContactProvider.viewPhoto(
                                  addContactProvider.photo!.files.first);
                            },
                            child: const Text("View"),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {
                              addContactProvider.removePhoto();
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
                    child: Text(
                        "File Name : ${addContactProvider.photo?.files.first.name ?? "-"} "),
                  ),
                ],
              ),
              TextFormFieldWidget(
                controller: addContactProvider.nameController,
                validator: (value) {
                  return addContactProvider.validateName(value);
                },
                labelText: 'Name',
                hintText: 'Insert Your Name',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              TextFormFieldWidget(
                controller: addContactProvider.phoneController,
                validator: (value) {
                  return addContactProvider.validateNomor(value);
                },
                labelText: 'Nomor',
                hintText: '+62 ...',
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white),
                onPressed: () {
                  addContactProvider.sendNewContactData(context);
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
