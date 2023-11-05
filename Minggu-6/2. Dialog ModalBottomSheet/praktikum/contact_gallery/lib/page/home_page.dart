import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../model/contact_model.dart';
import '../theme/theme_text_style.dart';
import '../widget/header_contact_widget.dart';
import 'edit_contact_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  int _selectedRoute = 0;

  @override
  Widget build(BuildContext context) {
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
              selected: _selectedRoute == 0,
              selectedTileColor: Colors.blue,
              selectedColor: Colors.white,
              onTap: () {
                setState(() {
                  _selectedRoute = 0;
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/');
                });
              },
            ),
            ListTile(
              title: const Text("Gallery"),
              selected: _selectedRoute == 1,
              selectedTileColor: Colors.blue,
              selectedColor: Colors.white,
              onTap: () {
                setState(() {
                  _selectedRoute = 1;
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/gallery-page');
                });
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
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  indent: 30,
                  endIndent: 30,
                ),
                itemCount: contactModel.length,
                itemBuilder: (context, index) {
                  final data = contactModel[index];
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
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.nomor!),
                        const SizedBox(height: 10),
                        Text(data.currentDate.toString()),
                        Row(
                          children: [
                            const Text("Color: "),
                            Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: data.myColor,
                              ),
                            )
                          ],
                        ),
                        Text(data.namaFile ?? "No photo yet."),
                      ],
                    ),
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
                    hoverColor: Colors.black,
                    trailing: Wrap(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return EditContactPage(
                            //         contactModel: ContactModel(
                            //           index: index,
                            //           name: data.name,
                            //           nomor: data.nomor,
                            //           currentDate: data.currentDate,
                            //           myColor: data.myColor,
                            //           photo: data.photo,
                            //           namaFile: data.namaFile,
                            //         ),
                            //       );
                            //     },
                            //   ),
                            // ).then((value) {
                            //   if (value != null) {
                            //     final editData = value as ContactModel;
                            //     contactModel[index] = editData;
                            //     setState(() {});
                            //   }
                            // });
                            Navigator.pushNamed(
                              context,
                              '/edit-page',
                              arguments: EditContactArguments(
                                  contactModel: ContactModel(
                                index: index,
                                name: data.name,
                                nomor: data.nomor,
                                currentDate: data.currentDate,
                                myColor: data.myColor,
                                photo: data.photo,
                                namaFile: data.namaFile,
                              )),
                            ).then((value) {
                              if (value != null) {
                                final editData = value as ContactModel;
                                contactModel[index] = ContactModel(
                                  name: editData.name,
                                  nomor: editData.nomor,
                                  currentDate: editData.currentDate,
                                  myColor: editData.myColor,
                                  photo: editData.photo,
                                  namaFile: editData.namaFile,
                                );
                                setState(() {});
                              }
                            });
                          },
                        ), // icon-1
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            contactModel.removeAt(index);
                            setState(() {});
                          },
                        ), // icon-1
                        // icon-2
                      ],
                    ),
                  );
                },
              ))
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 20),
        child: FloatingActionButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return const AddContactPage();
            //     },
            //   ),
            // ).then(
            //   (value) {
            //     if (value != null) {
            //       final newData = value as ContactModel;
            //       contactModel.add(ContactModel(
            //         name: newData.name,
            //         nomor: newData.nomor,
            //         currentDate: newData.currentDate,
            //         myColor: newData.myColor,
            //         photo: newData.photo,
            //         namaFile: newData.namaFile,
            //       ));
            //       setState(() {});
            //     }
            //   },
            // );
            Navigator.pushNamed(context, '/add-page').then((value) {
              if (value != null) {
                final newData = value as ContactModel;
                contactModel.add(ContactModel(
                  name: newData.name,
                  nomor: newData.nomor,
                  currentDate: newData.currentDate,
                  myColor: newData.myColor,
                  photo: newData.photo,
                  namaFile: newData.namaFile,
                ));
                setState(() {});
              }
            });
          },
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
    );
  }
}
