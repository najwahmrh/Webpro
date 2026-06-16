import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HalamanPenghitung extends StatelessWidget {
  const HalamanPenghitung({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penghitung Mahasiswa'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: const PenghitungMahasiswa(),
      ),
    );
  }
}

class PenghitungMahasiswa extends StatefulWidget{
  const PenghitungMahasiswa({super.key});

  @override
  State<PenghitungMahasiswa> createState() => _PenghitungMahasiswaState();
}

class _PenghitungMahasiswaState extends State<PenghitungMahasiswa>{
  int jumlahHadir = 0;

  @override
  Widget build(BuildContext context){
    return Center(
      child: Card(
        elevation: 8,
        shadowColor: Colors.deepPurple.withOpacity(0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.groups_rounded, size: 64, color: Colors.deepPurple),
              const SizedBox(height: 16),
              Text(
                'Praktikan yang Hadir',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$jumlahHadir',
                  style: GoogleFonts.poppins(fontSize: 64, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.person_add_alt_1_rounded),
                  onPressed: (){
                    setState(() {
                      jumlahHadir++;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Satu mahasiswa ditambahkan! Total: $jumlahHadir'),
                        duration: const Duration(seconds: 1),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.green.shade600,
                      )
                    );
                  },
                  label: const Text('Tambah Mahasiswa', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 4,
                  ),
                ),
              ),
              if (jumlahHadir > 0) ...[
                const SizedBox(height: 12),
                TextButton.icon(
                  onPressed: () {
                    setState(() => jumlahHadir = 0);
                  }, 
                  icon: const Icon(Icons.refresh, color: Colors.redAccent),
                  label: const Text('Reset', style: TextStyle(color: Colors.redAccent)),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}