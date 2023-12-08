import 'package:contact_app/model/contact_model.dart';
import 'package:contact_app/screen/edit_contact/edit_contact_view_model.dart';
import 'package:contact_app/screen/home/home_view_model.dart';
import 'package:contact_app/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/theme_text_style.dart';
import '../../widget/header_contact_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    homeViewModel.refreshContacts();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          const HeaderContactWidget(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Consumer<HomeViewModel>(
              builder: (context, homeProvider, child) {
                if (contactList.isEmpty == true) {
                  return Center(
                    child: Text(
                      'No Contacts Yet.',
                      style: ThemeTextStyle().m3BodyMedium,
                    ),
                  );
                } else if (contactList.isEmpty == false) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      indent: 30,
                      endIndent: 30,
                    ),
                    itemCount: contactList.length,
                    itemBuilder: (context, index) {
                      final data = contactList[index];
                      return ListTile(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        tileColor: const Color.fromARGB(255, 232, 244, 249),
                        splashColor: Colors.lightBlue[100],
                        onTap: () {},
                        title: Text(
                          data.name,
                          style: ThemeTextStyle().m3BodyLarge,
                        ),
                        subtitle: Text(data.phone),
                        leading: data.photoName == null
                            ? CircleAvatar(
                                radius: 40,
                                child: Text(
                                  data.name.split("")[0],
                                  style: ThemeTextStyle().m3TitleMedium,
                                ),
                              )
                            : CircleAvatar(
                                backgroundImage: Utility.imageFromBase64String(
                                    data.photoName!),
                                radius: 40,
                              ),
                        trailing: Wrap(
                          children: <Widget>[
                            Consumer<EditContactViewModel>(
                              builder: (context, editContactProvider, child) {
                                return IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () async {
                                    editContactProvider.editContact(
                                      id: data.id!,
                                      context: context,
                                    );
                                  },
                                );
                              },
                            ), // icon-1
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                homeProvider.deleteContact(data.id!);
                              },
                            ), // icon-1
                            // icon-2
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text(
                      'Oops! Something wrong..',
                      style: ThemeTextStyle().m3BodyMedium,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Consumer<HomeViewModel>(
        builder: (context, homeViewModel, child) {
          return Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 20),
            child: FloatingActionButton(
              onPressed: () {
                homeViewModel.addContact(context);
              },
              child: const Icon(
                Icons.add,
                size: 30,
              ),
            ),
          );
        },
      ),
    );
  }
}
