import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HalamanTextField extends StatefulWidget {
  const HalamanTextField({super.key});

  @override
  State<HalamanTextField> createState() => _HalamanTextFieldState();
}

class _HalamanTextFieldState extends State<HalamanTextField> {
  final TextEditingController _usernameController = TextEditingController();

  void _tampilkanNotifikasi(String value) {
    if (value.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Data tidak boleh kosong!"),
          backgroundColor: Colors.red.shade600,
          behavior: SnackBarBehavior.floating,
        )
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.green),
            const SizedBox(width: 8),
            Text("Data Disubmit", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          ],
        ),
        content: Text("Anda memasukkan:\n\n$value", style: const TextStyle(fontSize: 16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK", style: TextStyle(fontWeight: FontWeight.bold)),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Text Field"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Input Data",
                  style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
                Text(
                  "Ketik sesuatu dan tekan tombol submit di bawah.",
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 32),
                Card(
                  elevation: 6,
                  shadowColor: Colors.deepPurple.withOpacity(0.2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        const Icon(Icons.edit_document, size: 48, color: Colors.deepPurple),
                        const SizedBox(height: 24),
                        TextField(
                          controller: _usernameController,
                          maxLength: 20,
                          onSubmitted: _tampilkanNotifikasi,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            labelText: "Username",
                            labelStyle: const TextStyle(color: Colors.deepPurple),
                            hintText: "Silakan masukkan username...",
                            helperText: "Maksimal 20 karakter",
                            prefixIcon: const Icon(Icons.supervisor_account, color: Colors.deepPurple),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              _tampilkanNotifikasi(_usernameController.text);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            ),
                            child: const Text("Kirim / Submit", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
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