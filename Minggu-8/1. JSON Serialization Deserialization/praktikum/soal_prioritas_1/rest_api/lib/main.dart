import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/screen/add_contact/add_contact_view_model.dart';
import 'package:rest_api/screen/edit_contact/edit_contact_view_model.dart';

import 'package:rest_api/screen/gallery/gallery_screen.dart';
import 'package:rest_api/screen/home/home_view_model.dart';
import 'package:rest_api/screen/image/image_screen.dart';

import 'screen/add_contact/add_contact_screen.dart';
import 'screen/edit_contact/edit_contact_screen.dart';

import 'screen/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    MultiProvider(
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
      ],
      child: const Main(),
    ),
  );
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        '/add-page': (context) => const AddContactScreen(),
        '/edit-page': (context) => const EditContactScreen(),
        '/gallery-page': (context) => const GalleryScreen(),
        '/image-page': (context) => const ImageScreen(),
      },
      initialRoute: '/',
    );
  }
}
