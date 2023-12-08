import 'package:contact_app/screen/edit_contact/edit_contact_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/contact_model.dart';
import '../../utility/utility.dart';
import '../../widget/text_form_field_widget.dart';

class EditContactArguments {
  final ContactModel contactModel;

  EditContactArguments({required this.contactModel});
}

class EditContactScreen extends StatelessWidget {
  const EditContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final editContactProvider = Provider.of<EditContactViewModel>(context);

    editContactProvider.initValue(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close_rounded)),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Edit Contact"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: editContactProvider.editKey,
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
                            image: editContactProvider.photoName != null
                                ? Utility.imageFromBase64String(
                                    editContactProvider.photoName!)
                                : const AssetImage("assets/people_account.png"),
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
                              editContactProvider.choosePhoto();
                            },
                            child: const Text("Choose Photo"),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              editContactProvider.viewPhoto(context);
                            },
                            child: const Text("View"),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {
                              editContactProvider.removePhoto();
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
                  const SizedBox(height: 30),
                ],
              ),
              TextFormFieldWidget(
                controller: editContactProvider.nameController,
                validator: (value) {
                  return editContactProvider.validateName(value);
                },
                labelText: 'Name',
                hintText: 'Insert Your Name',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              TextFormFieldWidget(
                controller: editContactProvider.phoneController,
                validator: (value) {
                  return editContactProvider.validateNomor(value);
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
                  editContactProvider.sendNewEditedContactData(context);
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
