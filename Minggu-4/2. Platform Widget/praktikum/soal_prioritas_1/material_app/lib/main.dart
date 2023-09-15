import 'package:flutter/material.dart';
import 'drawer_item.dart';
import 'settings.dart';

void main() {
  runApp(MaterialApp(
    home: const Home(),
    theme: ThemeData.dark(), // Mengaktifkan tema dark mode
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App'),
      ),
      body: const Center(
        child: Text('This is Material App'),
      ),
      drawer: Drawer(
        child: Material(
          color: const Color.fromARGB(255, 69, 69, 69),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
            child: Column(
              children: [
                DrawerItem(
                    name: 'Home',
                    icon: Icons.home,
                    onPressed: () => onItemPressed(context, index: 0)),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  thickness: 1,
                  height: 10,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 30,
                ),
                DrawerItem(
                    name: 'Settings',
                    icon: Icons.settings,
                    onPressed: () => onItemPressed(context, index: 1)),
                const SizedBox(
                  height: 30,
                ),
                DrawerItem(
                    name: 'Log out', icon: Icons.logout, onPressed: () => {}),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Settings()));
        break;
      default:
        Navigator.pop(context);
        break;
    }
  }
}
