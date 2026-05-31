import 'package:flutter/material.dart';

class ProfilTab extends StatelessWidget {
  const ProfilTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // --- 1. LINGKARAN BIRU ATAS ---
          // Positioned digunakan untuk menggeser lingkaran hingga setengahnya terpotong layar
          Positioned(
            top: -150,
            left: -50,
            right: -50,
            child: Container(
              height: 350,
              decoration: const BoxDecoration(
                color: Color(0xFFE3F2FD), // Biru pastel sangat muda
                shape: BoxShape.circle,
              ),
            ),
          ),

          // --- 2. LINGKARAN BIRU BAWAH ---
          Positioned(
            bottom: -150,
            left: -50,
            right: -50,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                color: Color(0xFFE3F2FD),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // --- 3. KONTEN PROFIL ---
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 30),

                // --- AVATAR BUNDAR ---
                Container(
                  padding: const EdgeInsets.all(
                    3,
                  ), // Memberi ruang untuk border abu-abu
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300, width: 1.5),
                  ),
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(
                      0xFFF5F5F5,
                    ), // Warna latar ikon abu-abu sangat muda
                    child: Icon(
                      Icons.person_outline_rounded,
                      size: 50,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // --- DAFTAR INFORMASI (LIST) ---
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                    ), // Jarak kanan kiri
                    child: ListView(
                      physics:
                          const NeverScrollableScrollPhysics(), // Mematikan scroll karena konten sedikit
                      children: [
                        _buildDivider(),
                        _buildProfileItem(
                          Icons.person_outline,
                          'Arsala Arief Firmansyah',
                        ),
                        _buildDivider(),
                        _buildProfileItem(
                          Icons.call_outlined,
                          '1462300022',
                        ), // NBI
                        _buildDivider(),
                        _buildProfileItem(
                          null,
                          'famosrar@gmail.com',
                        ), // Email tanpa ikon
                        _buildDivider(),
                        _buildProfileItem(
                          Icons.location_on_outlined,
                          'Surabaya',
                        ),
                        _buildDivider(),

                        _buildProfileItem(
                          Icons.camera_alt_outlined,
                          'arsalaha16',
                        ),
                        _buildDivider(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- FUNGSI BANTUAN ---
  Widget _buildProfileItem(IconData? icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: icon != null
                ? Icon(icon, color: Colors.lightBlue, size: 26)
                : null,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // --- FUNGSI BANTUAN ---
  Widget _buildDivider() {
    return Divider(color: Colors.grey.shade300, thickness: 1, height: 1);
  }
}
