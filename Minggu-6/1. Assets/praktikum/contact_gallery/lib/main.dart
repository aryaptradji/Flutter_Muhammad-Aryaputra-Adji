import 'package:contact_gallery/page/image_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'page/add_contact_page.dart';
import 'page/edit_contact_page.dart';
import 'page/gallery_page.dart';
import 'page/home_page.dart';

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
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/add-page': (context) => const AddContactPage(),
        '/edit-page': (context) => const EditContactPage(),
        '/gallery-page': (context) => const GalleryPage(),
        '/image-page': (context) => const ImagePage(),
      },
      initialRoute: '/',
    );
  }
}
