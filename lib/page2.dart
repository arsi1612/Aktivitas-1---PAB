import 'package:flutter/material.dart';
import 'page3.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      body: Column(
        children: [
          // --- 1. CUSTOM HEADER DENGAN GRADASI ---
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 60,
              left: 25,
              right: 25,
              bottom: 40,
            ),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF00695C), Color(0xFF26A69A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.teal.withOpacity(0.4),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tombol Back (Opsional, karena ini tab utama bisa dihilangkan, tapi dibiarkan saja gapapa)
                const SizedBox(height: 25),
                const Text(
                  'Ruang Baca Digital:',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Pinjam & Baca Buku secara Gratis',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // --- 2. LIST KATEGORI BUKU ---
          Expanded(
            child: ListView(
              // PERBAIKAN DI SINI: Menambahkan bottom: 120 agar tidak tertutup navbar
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 120),
              physics: const BouncingScrollPhysics(),
              children: [
                _buildModernCategoryCard(
                  context,
                  'Fiksi & Novel',
                  Icons.menu_book_rounded,
                  Colors.blue,
                  const Page3(),
                ),
                const SizedBox(height: 16),
                _buildModernCategoryCard(
                  context,
                  'Teknologi & IT',
                  Icons.computer_rounded,
                  Colors.orange,
                  const Page3(),
                ),
                const SizedBox(height: 16),
                _buildModernCategoryCard(
                  context,
                  'Sains & Matematika',
                  Icons.science_rounded,
                  Colors.purple,
                  const Page3(),
                ),
                const SizedBox(height: 16),
                _buildModernCategoryCard(
                  context,
                  'Sejarah Dunia',
                  Icons.public_rounded,
                  Colors.green,
                  const Page3(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- 3. FUNGSI WIDGET UNTUK KARTU YANG ESTETIK ---
  Widget _buildModernCategoryCard(
    BuildContext context,
    String judul,
    IconData ikon,
    MaterialColor warnaIkon,
    Widget tujuan,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => tujuan),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                // Ikon dengan latar belakang warna pastel
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: warnaIkon.shade50,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(ikon, color: warnaIkon.shade700, size: 28),
                ),
                const SizedBox(width: 20),

                // Teks Judul Kategori
                Expanded(
                  child: Text(
                    judul,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3142),
                    ),
                  ),
                ),

                // Ikon Panah Kanan
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey.shade500,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
