import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HalamanButton extends StatelessWidget {
  const HalamanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Button"),
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
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.touch_app_rounded, size: 48, color: Colors.deepPurple),
                  const SizedBox(height: 16),
                  Text(
                    "Coba tekan tombol di bawah",
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey.shade700),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.login_rounded),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            title: Row(
                              children: [
                                const Icon(Icons.notifications_active, color: Colors.amber),
                                const SizedBox(width: 8),
                                Text("Notifikasi", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            content: const Text("Button Login berhasil ditekan!", style: TextStyle(fontSize: 16)),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Tutup", style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ],
                          );
                        },
                      );
                    }, 
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.deepPurple,
                      side: const BorderSide(color: Colors.deepPurple, width: 2),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
                    ),
                    label: Text("LOGIN SEKARANG", style: GoogleFonts.poppins(fontWeight: FontWeight.bold))
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ); 
  }
}