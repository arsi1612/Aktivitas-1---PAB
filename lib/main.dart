import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';
import 'profil_tab.dart'; // Tambahan import untuk halaman profil baru

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ruang Baca Digital',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const Page1(),
    );
  }
}

// --- WIDGET NAVIGASI UTAMA ---
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  // Daftar halaman SEKARANG ADA 3
  final List<Widget> _halaman = [
    const Page2(), // Index 0: Beranda
    const Page3(), // Index 1: Katalog
    const ProfilTab(), // Index 2: Profile (Baru ditambahkan)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: _selectedIndex, children: _halaman),

      // --- DESAIN FLOATING BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(
          left: 20, // Jarak sedikit dikurangi agar 3 ikon lebih leluasa
          right: 20,
          bottom: 25,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.teal.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.teal.shade700,
            unselectedItemColor: Colors.grey.shade400,
            showUnselectedLabels: false,
            showSelectedLabels: true,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,

            // ITEM NAVIGASI SEKARANG ADA 3
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.home_rounded, size: 28),
                ),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.menu_book_rounded, size: 28),
                ),
                label: 'Katalog',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.person_outline_rounded, size: 28),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
