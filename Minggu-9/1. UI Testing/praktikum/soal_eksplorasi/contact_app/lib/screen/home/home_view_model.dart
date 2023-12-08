import 'package:contact_app/database/contact_database.dart';
import 'package:contact_app/model/contact_model.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  @override
  void dispose() {
    ContactDatabase.instance.closeDb();
    super.dispose();
  }

  void refreshContacts() async {
    contactList = await ContactDatabase.instance.readAllContactsDb();
    notifyListeners();
  }

  void deleteContact(int id) async {
    await ContactDatabase.instance.deleteContact(id);
    refreshContacts();
  }

  void addContact(BuildContext context) {
    Navigator.pushNamed(context, '/add-page');
    refreshContacts();
  }
}
