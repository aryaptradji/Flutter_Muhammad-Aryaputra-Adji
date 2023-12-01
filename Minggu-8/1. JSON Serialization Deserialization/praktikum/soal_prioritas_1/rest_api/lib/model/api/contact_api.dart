import 'package:dio/dio.dart';
import 'package:rest_api/model/contact_model.dart';

class ContactApi {
  /// POST CONTACT
  static Future<ContactModel> postContact(String name, String phone) async {
    late ContactModel contactData;

    final response = await Dio().post(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
      data: {
        "name": name,
        "phone": phone,
      },
    );

    contactData = ContactModel.fromJson(response.data);

    return contactData;
  }
}
