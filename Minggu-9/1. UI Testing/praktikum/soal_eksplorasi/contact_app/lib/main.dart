import 'package:contact_app/screen/add_contact/add_contact_view_model.dart';
import 'package:contact_app/screen/edit_contact/edit_contact_view_model.dart';
import 'package:contact_app/screen/home/home_view_model.dart';
import 'package:contact_app/screen/image/profile_picture_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'screen/add_contact/add_contact_screen.dart';
import 'screen/edit_contact/edit_contact_screen.dart';

import 'screen/home/home_screen.dart';
import 'screen/image/profile_picture_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddContactViewModel>(
          create: (context) => AddContactViewModel(),
        ),
        ChangeNotifierProvider<EditContactViewModel>(
          create: (context) => EditContactViewModel(),
        ),
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider<ProfilePictureViewModel>(
          create: (context) => ProfilePictureViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: Colors.blue,
          brightness: Brightness.light,
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const HomeScreen(),
          '/add-page': (context) => const AddContactScreen(),
          '/edit-page': (context) => const EditContactScreen(),
          '/pp-page': (context) => const ProfilePictureScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}
