import 'package:contact_app/page/contact_page/widget/contact_data.dart';
import 'package:contact_app/page/contact_page/widget/header_contact_widget.dart';

import 'package:contact_app/theme/theme_color.dart';
import 'package:contact_app/theme/theme_text_style.dart';
import 'package:contact_app/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _nameController = TextEditingController();
  final _nomorController = TextEditingController();
  bool isEditPressed = false;

  List<ContactData> contactData = [];

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              "Contacts",
              style: ThemeTextStyle().m3DisplayLarge,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: ListView(children: [
        Column(
          children: [
            const HeaderContactWidget(),
            Form(
              key: formKey,
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 49),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormFieldWidget(
                      controller: _nameController,
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Nama wajib diisi';
                        } else if (!RegExp(r'^([a-zA-Z\.]+ ?)+$')
                            .hasMatch(value!)) {
                          return 'Nama tidak boleh mengandung angka atau karakter khusus';
                        } else if (!RegExp(r'^([A-Z]{1}[a-z]*\.? ?)+$')
                            .hasMatch(value)) {
                          return 'Tiap kata dari nama harus diawali dengan Huruf Kapital';
                        } else if (!RegExp(
                                r'^([a-zA-Z]+\.? {1})+([a-zA-Z]+\.? ?)+$')
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
                      controller: _nomorController,
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Nomor handphone wajib diisi';
                        } else if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
                          return 'Nomor handphone harus terdiri dari angka';
                        } else if (!RegExp(r'^0+[0-9]+$').hasMatch(value)) {
                          return 'Nomor handphone harus dimulai dengan angka 0';
                        } else if (!RegExp(r'^([0-9]{8,15})+$')
                            .hasMatch(value)) {
                          return 'Panjang nomor handphone terdiri dari 8-15 digit';
                        }
                        return null;
                      },
                      labelText: 'Nomor',
                      hintText: '+62 ...',
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: 94,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ThemeColor().m3SysLightPurple),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            if (formKey.currentState?.validate() == true) {
                              if (contactData.isNotEmpty == true) {
                                contactData.insert(
                                    0,
                                    ContactData(
                                      name: _nameController.text,
                                      nomor: _nomorController.text,
                                    ));
                                _nameController.clear();
                                _nomorController.clear();
                              } else if (contactData.isEmpty == true) {
                                contactData.add(ContactData(
                                  name: _nameController.text,
                                  nomor: _nomorController.text,
                                ));
                                _nameController.clear();
                                _nomorController.clear();
                              }
                              setState(() {});
                            }
                          },
                          borderRadius: BorderRadius.circular(20),
                          splashColor: Colors.white30,
                          child: Center(
                            child: Text(
                              "Submit",
                              style: ThemeTextStyle().m3LabelLarge,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Center(
            child: Text(
          "List Contacts",
          style: ThemeTextStyle().m3HeadlineSmall,
        )),
        const SizedBox(height: 15),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 235,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(35),
                ),
                color: ThemeColor().m3SysLightPurple50),
            child: ListView.builder(
              itemCount: contactData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    contactData[index].name ?? "",
                    style: ThemeTextStyle().m3BodyLarge,
                  ),
                  subtitle: Text(
                    contactData[index].nomor ?? "",
                    style: ThemeTextStyle().m3BodyMedium,
                  ),
                  leading: Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: ThemeColor().m3SysLightPurple90),
                    child: Center(
                      child: Text(
                        contactData[index].name?[0] ?? "",
                        style: ThemeTextStyle().m3TitleMedium,
                      ),
                    ),
                  ),
                  trailing: Wrap(
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          setState(() {
                            _nameController.text =
                                contactData[index].name ?? "";
                            _nomorController.text =
                                contactData[index].nomor ?? "";
                          });
                        },
                      ), // icon-1
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          contactData.removeAt(index);
                          setState(() {});
                        },
                      ), // icon-1
                      // icon-2
                    ],
                  ),
                );
              },
            ))
      ]),
    );
  }
}
