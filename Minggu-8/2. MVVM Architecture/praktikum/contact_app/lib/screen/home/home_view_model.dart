import 'package:flutter/material.dart';
import 'package:rest_api/model/contact_model.dart';

class HomeViewModel with ChangeNotifier {
  int _selectedRoute = 0;
  int get selectedRoute => _selectedRoute;

  List<ContactModel> _contactList = [];
  List<ContactModel> get contactList => _contactList;

  void changeRouteDrawer({
    required BuildContext context,
    required int value,
    required String routeName,
  }) {
    _selectedRoute = value;
    Navigator.pop(context);
    Navigator.pushNamed(context, routeName);
    notifyListeners();
  }

  void receiveNewContactData(ContactModel value) {
    _contactList.add(
      ContactModel(
        id: value.id,
        name: value.name,
        phone: value.phone,
        photo: value.photo,
        fileName: value.fileName,
      ),
    );
    notifyListeners();
  }

  void deleteContact(int index) {
    _contactList.removeAt(index);
    notifyListeners();
  }

  void receiveEditData({required ContactModel value, required int index}) {
    _contactList[index] = ContactModel(
      name: value.name,
      phone: value.phone,
      photo: value.photo,
      fileName: value.fileName,
    );
    notifyListeners();
  }
}
