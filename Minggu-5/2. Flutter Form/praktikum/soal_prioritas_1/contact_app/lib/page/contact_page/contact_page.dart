import 'package:contact_app/page/contact_page/widget/contact_data.dart';
import 'package:contact_app/page/contact_page/widget/header_contact_widget.dart';
import 'package:contact_app/page/contact_page/widget/list_contact_widget.dart';
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
  final nameController = TextEditingController();
  final nomorController = TextEditingController();

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
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, bottom: 49),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormFieldWidget(
                    controller: nameController,
                    labelText: 'Name',
                    hintText: 'Insert Your Name',
                  ),
                  const SizedBox(height: 16),
                  TextFormFieldWidget(
                    controller: nomorController,
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
                          setState(() {
                            contactData.add(ContactData(
                                name: nameController.text,
                                nomor: nomorController.text));
                          });
                          print(contactData);
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
            )
          ],
        ),
      ]),
    );
  }
}
