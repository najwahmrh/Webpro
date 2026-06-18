import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/notification_service.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraScreen({Key? key, required this.cameras}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isCameraInitialized = false;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  void _initCamera() {
    if (widget.cameras.isNotEmpty) {
      _controller = CameraController(
        widget.cameras.first,
        ResolutionPreset.medium,
      );
      _initializeControllerFuture = _controller.initialize();
    }
  }

  @override
  void dispose() {
    if (_isCameraInitialized) {
      _controller.dispose();
    }
    super.dispose();
  }

  Future<void> _takePicture() async {
    if (!_isCameraInitialized) {
      _initCamera();
      setState(() {
        _isCameraInitialized = true;
      });
      return;
    }

    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();

      setState(() {
        _imageFile = File(image.path);
      });

      await NotificationService().showNotification(
        'Gambar Ditangkap',
        'Berhasil mengambil gambar dari kamera.',
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> _pickFromGallery() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });

        await NotificationService().showNotification(
          'Gambar Dipilih',
          'Berhasil memilih gambar dari galeri.',
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void _resetImage() {
    setState(() {
      _imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAFA),
      appBar: AppBar(
        title: const Text('Pertemuan 12 - Hardware API', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        actions: [
          if (_imageFile != null)
            IconButton(
              icon: const Icon(Icons.refresh, color: Colors.white),
              onPressed: _resetImage,
              tooltip: 'Ambil Ulang',
            )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildProfileCard(),
              const SizedBox(height: 24),
              _buildPreviewArea(),
              const SizedBox(height: 24),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue.shade100,
              child: const Icon(Icons.person, size: 40, color: Colors.blue),
            ),
            const SizedBox(height: 16),
            const Text(
              'Najwa Humairah', 
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue, 
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.blue.shade100.withOpacity(0.5), 
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'NIM: 2311102134',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1565C0), 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreviewArea() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 5,
          )
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: _imageFile != null
          ? Image.file(_imageFile!, fit: BoxFit.cover)
          : !_isCameraInitialized
              ? const Center(
                  child: Text(
                    'Klik "Buka Kamera" untuk mulai',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                )
              : widget.cameras.isEmpty
                  ? const Center(child: Text('Kamera tidak tersedia'))
              : FutureBuilder<void>(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return CameraPreview(_controller);
                    } else {
                      return const Center(child: CircularProgressIndicator(color: Colors.teal));
                    }
                  },
                ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: _takePicture,
            icon: Icon(_isCameraInitialized ? Icons.camera : Icons.camera_alt, color: Colors.white),
            label: Text(_isCameraInitialized ? 'Ambil Foto' : 'Buka Kamera', style: const TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 2,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: _pickFromGallery,
            icon: const Icon(Icons.photo_library, color: Colors.blue),
            label: const Text('Galeri', style: TextStyle(color: Colors.blue)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              side: const BorderSide(color: Colors.blue),
              elevation: 0,
            ),
          ),
        ),
      ],
    );
  }
}
