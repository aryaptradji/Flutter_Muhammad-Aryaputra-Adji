import 'package:flutter/material.dart';
import 'drawer_item.dart';
import 'settings.dart';
import 'contact_model.dart';

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
        title: const Text(
          'Contact App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          const Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
              child: Text(
                'Contact List',
                style: TextStyle(
                    color: Color.fromARGB(255, 37, 245, 179), fontSize: 20),
              )),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: contactList.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final contact = contactList[index];
              return Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                width: double.infinity,
                child: ListTile(
                  leading: Container(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.width / 6,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 37, 245, 179)),
                    alignment: Alignment.center,
                    child: Text(
                      contact.name[0],
                      style: const TextStyle(
                          color: Color.fromARGB(255, 61, 60, 60),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(contact.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  subtitle: Text(contact.number,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              );
            },
          )
        ],
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
