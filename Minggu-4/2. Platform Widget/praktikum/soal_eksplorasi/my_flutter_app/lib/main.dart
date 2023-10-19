import 'package:flutter/material.dart';

void main() {
  runApp(const MainPage());
}

// Class MainPage: Menampilkan semua isi halaman
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Mengisisiasi index
  int _selectedIndex = 0;

  // Membuat List yang berisi Widget-Widget halaman
  final List<Widget> pageOptions = [
    FavoritePage(),
    const SearchPage(),
    const InformationPage()
  ];

  // Membuat List yang berisi Widget-Widget AppBar
  final List<Widget> appBarOptions = [
    const FavoriteAppBar(),
    const SearchAppBar(),
    const InformationAppBar()
  ];

  // Method untuk berpindah-pindah item Navigation Bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6200EE),
          brightness: Brightness.light,
          primary: const Color(0xFF6200EE),
          secondary: const Color(0xFF03DAC5),
        ),
      ),
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            // Memanggil isi List<Widget> appBarOptions
            child: appBarOptions[_selectedIndex]),
        // Memanggil isi List<Widget> pageOptions
        body: pageOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF6200EE),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white60,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorites",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: "Information",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        floatingActionButton: SizedBox(
          width: 65,
          height: 65,
          child: FloatingActionButton(
            onPressed: () {},
            foregroundColor: Colors.black,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

// Class FavoritePage: Menampilkan isi halaman Favorite
class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  final List<String> listItem = [
    "Learn Flutter",
    "Learn ReactJS",
    "Learn VueJS",
    "Learn Tailwind CSS",
    "Learn UI/UX",
    "Learn Figma",
    "Learn Digital Marketing"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => ListTile(
        title: Text(
          listItem[index],
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      separatorBuilder: (context, index) => const Divider(
        indent: 20,
        thickness: 1,
      ),
      itemCount: listItem.length,
    );
  }
}

// Class FavoriteAppBar: Menampilkan AppBar halaman Favorite
class FavoriteAppBar extends StatelessWidget {
  const FavoriteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("My Flutter App"),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}

// Class SearchPage: Menampilkan isi halaman Search
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("This is Search Page"),
    );
  }
}

// Class SearchAppBar: Menampilkan AppBar halaman Search
class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Search"),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}

// Class InformationPage: Menampilkan isi halaman Information
class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("This is Information Page"),
    );
  }
}

// Class InformationAppbar: Menampilkan AppBar halaman Information
class InformationAppBar extends StatelessWidget {
  const InformationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Information"),
      centerTitle: true,
    );
  }
}
