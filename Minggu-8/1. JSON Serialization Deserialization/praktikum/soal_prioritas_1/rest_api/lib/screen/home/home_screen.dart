import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/model/contact_model.dart';
import 'package:rest_api/screen/add_contact/add_contact_view_model.dart';
import 'package:rest_api/screen/edit_contact/edit_contact_view_model.dart';
import 'package:rest_api/screen/home/home_view_model.dart';

import '../../theme/theme_text_style.dart';
import '../../widget/header_contact_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Contact App"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 100,
              child: DrawerHeader(
                child: Center(
                  child: Text(
                    "Pick a Page",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text("Contact"),
              selected: homeViewModel.selectedRoute == 0,
              selectedTileColor: Colors.blue,
              selectedColor: Colors.white,
              onTap: () {
                homeViewModel.changeRouteDrawer(
                  context: context,
                  value: 0,
                  routeName: '/',
                );
              },
            ),
            ListTile(
              title: const Text("Gallery"),
              selected: homeViewModel.selectedRoute == 1,
              selectedTileColor: Colors.blue,
              selectedColor: Colors.white,
              onTap: () {
                homeViewModel.changeRouteDrawer(
                  context: context,
                  value: 1,
                  routeName: '/gallery-page',
                );
              },
            )
          ],
        ),
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
                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    indent: 30,
                    endIndent: 30,
                  ),
                  itemCount: homeProvider.contactList.length,
                  itemBuilder: (context, index) {
                    final data = homeProvider.contactList[index];
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
                        data.name ?? "",
                        style: ThemeTextStyle().m3BodyLarge,
                      ),
                      subtitle: Text(data.phone),
                      leading: data.photo == null
                          ? CircleAvatar(
                              radius: 40,
                              child: Text(
                                data.name?.split("")[0] ?? "",
                                style: ThemeTextStyle().m3TitleMedium,
                              ),
                            )
                          : CircleAvatar(
                              backgroundImage: FileImage(
                                File(data.photo?.paths.first ?? "No File"),
                              ),
                              radius: 40,
                            ),
                      trailing: Wrap(
                        children: <Widget>[
                          Consumer<EditContactViewModel>(
                            builder: (context, editContactProvider, child) {
                              return IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () async {
                                  final value =
                                      await editContactProvider.sendEditData(
                                    context: context,
                                    contactModel: data,
                                  );

                                  if (value != null) {
                                    homeProvider.receiveEditData(
                                      value: value,
                                      index: value.id,
                                    );
                                  }
                                },
                              );
                            },
                          ), // icon-1
                          Consumer<AddContactViewModel>(
                            builder: (context, addContactProvider, child) {
                              return IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  homeProvider.deleteContact(index);
                                  addContactProvider.id--;
                                },
                              );
                            },
                          ), // icon-1
                          // icon-2
                        ],
                      ),
                    );
                  },
                );
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
                Navigator.pushNamed(context, '/add-page').then(
                  (value) {
                    if (value != null) {
                      homeViewModel
                          .receiveNewContactData(value as ContactModel);
                    }
                  },
                );
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
