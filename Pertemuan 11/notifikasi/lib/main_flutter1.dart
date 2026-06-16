import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HalamanFlutter1 extends StatelessWidget {
  const HalamanFlutter1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Flutter 1"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Row(
                        children: [
                          Icon(Icons.flutter_dash, color: Colors.white),
                          SizedBox(width: 8),
                          Text("Anda menekan logo Flutter!"),
                        ],
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.blue.shade600,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    )
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      )
                    ]
                  ),
                  child: const Icon(Icons.flutter_dash, size: 80, color: Colors.blue),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                "Welcome to Flutter",
                style: GoogleFonts.poppins(
                  fontSize: 28, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.deepPurple
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Ini adalah data saya yang ditampilkan\ndalam widget teks sederhana.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16, 
                  color: Colors.grey.shade600
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context, 
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      title: const Row(
                        children: [
                          Icon(Icons.notifications_active, color: Colors.deepPurple),
                          SizedBox(width: 8),
                          Text("Pesan Baru"),
                        ],
                      ),
                      content: const Text("Halo! Ini adalah notifikasi pop-up dari Halaman Flutter 1."),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK", style: TextStyle(fontWeight: FontWeight.bold)))
                      ],
                    )
                  );
                }, 
                icon: const Icon(Icons.touch_app), 
                label: const Text("Tampilkan Pop-up"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              )
            ],
          ),
        ),
      ),
    ); 
  }
}