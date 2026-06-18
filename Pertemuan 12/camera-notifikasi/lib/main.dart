import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'screens/camera_screen.dart';
import 'services/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi daftar kamera yang tersedia di perangkat
  final cameras = await availableCameras();

  // Inisialisasi layanan notifikasi
  await NotificationService().init();

  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  const MyApp({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pertemuan 12',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          primary: Colors.teal,
          background: const Color(0xFFF6FAFA),
        ),
        fontFamily: 'Inter', // Default fallback font, feel free to add a font asset
      ),
      home: CameraScreen(cameras: cameras),
    );
  }
}
