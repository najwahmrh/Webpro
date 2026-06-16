import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main1.dart';
import 'main_button.dart';
import 'main_colom.dart';
import 'main_container.dart';
import 'main_flutter1.dart';
import 'main_textfield.dart';

void main() {
  runApp(const AplikasiGabungan());
}

class AplikasiGabungan extends StatelessWidget {
  const AplikasiGabungan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo Menu & Tombol',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: const HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int _selectedIndex = 0;
  String selectedValue = 'Pilihan 1';

  // Helper function to build beautiful menu items
  Widget _buildMenuItem(BuildContext context, String title, IconData icon, Widget page) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple.shade100,
          child: Icon(icon, color: Colors.deepPurple),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> ruangan = <Widget>[
      // Home Page - Contains Navigation to other files
      ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 10),
          Text(
            'Navigasi Halaman',
            style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _buildMenuItem(context, 'Halaman Penghitung Mahasiswa', Icons.calculate, const HalamanPenghitung()),
          _buildMenuItem(context, 'Halaman Button', Icons.smart_button, const HalamanButton()),
          _buildMenuItem(context, 'Halaman Kolom & Form Login', Icons.login, const HalamanKolom()),
          _buildMenuItem(context, 'Halaman Container', Icons.check_box_outline_blank, const HalamanContainer()),
          _buildMenuItem(context, 'Halaman Flutter 1 (Basic)', Icons.flutter_dash, const HalamanFlutter1()),
          _buildMenuItem(context, 'Halaman Text Field', Icons.text_fields, const HalamanTextField()),
          const SizedBox(height: 20),
        ],
      ),

      // Buttons Page
      Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Text(
                        'Coba Tekan button Ini:',
                        style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.check_circle_outline),
                          onPressed: () {
                            debugPrint('ElevatedButton ditekan!');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('ElevatedButton ditekan!'),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              )
                            );
                          },
                          label: const Text('Submit (Elevated)'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton.icon(
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            debugPrint('TextButton sukses ditekan!');
                            showDialog(
                              context: context, 
                              builder: (context) => AlertDialog(
                                title: const Text('Halo'),
                                content: const Text('TextButton ditekan!'),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                actions: [
                                  TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))
                                ]
                              )
                            );
                          },
                          label: const Text('Menu (TextButton)'),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedValue,
                            isExpanded: true,
                            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple),
                            items: const [
                              DropdownMenuItem(value: 'Pilihan 1', child: Text('Pilihan 1')),
                              DropdownMenuItem(value: 'Pilihan 2', child: Text('Pilihan 2')),
                              DropdownMenuItem(value: 'Pilihan 3', child: Text('Pilihan 3')),
                            ],
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue!;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Anda memilih: $newValue'),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                )
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // Profile Page
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              '2311102134',
              style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey.shade600),
            ),
            Text(
              'Najwa Humairah',
              style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '2311102134 Najwa Humairah', 
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ruangan.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            )
          ]
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.smart_button_rounded), label: 'Buttons'),
            BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profil'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          elevation: 0,
          backgroundColor: Colors.white,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}