import 'package:flutter/material.dart';

class MyApp11_2 extends StatefulWidget {
  const MyApp11_2({Key? key}) : super(key: key);

  @override
  State<MyApp11_2> createState() => _MyApp11_2State();
}

class _MyApp11_2State extends State<MyApp11_2> {
  // Data awal untuk ListView
  final List<Map<String, String>> data = [
    {
      "title": "Native App",
      "platform": "Android, iOS",
      "lang": "Java, Kotlin, Swift, C#",
    },
    {
      "title": "Hybrid App",
      "platform": "Android, iOS, Web",
      "lang": "Javascript, Dart",
    },
  ];

  // Variabel untuk menampung inputan dari Dialog Form
  String titleInput = "";
  String platInput = "";
  String langInput = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]["title"] ?? ""),
            subtitle: Text(
                '${data[index]["platform"]} | ${data[index]["lang"]}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Memunculkan Dialog Form
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Add Data'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(labelText: 'Title'),
                      onChanged: (value) {
                        titleInput = value;
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Platform'),
                      onChanged: (value) {
                        platInput = value;
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Language'),
                      onChanged: (value) {
                        langInput = value;
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop(); // Tutup dialog
                    },
                  ),
                  TextButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      // Tambahkan data ke dalam list dan perbarui UI
                      setState(() {
                        data.add({
                          "title": titleInput,
                          "platform": platInput,
                          "lang": langInput,
                        });
                      });
                      Navigator.of(context).pop(); // Tutup dialog setelah submit
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}