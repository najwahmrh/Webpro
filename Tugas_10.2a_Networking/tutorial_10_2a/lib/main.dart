import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const ModNetworking());
}

class ModNetworking extends StatefulWidget {
  const ModNetworking({Key? key}) : super(key: key);

  @override
  State<ModNetworking> createState() => _ModNetworkingState();
}

class _ModNetworkingState extends State<ModNetworking> {
  List<Map> data = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var res = await http.get(Uri.parse(
        'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2025-03-15&endtime=2025-03-16&limit=20'));
    List<Map> tmp = [];
    var d = jsonDecode(res.body);
    for (int i = 0; i < d['features'].length; i++) {
      tmp.add({
        'desc': d['features'][i]['properties']['title'],
        'type': d['features'][i]['properties']['type']
      });
    }
    setState(() {
      data = tmp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Gempa',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Data Gempa'),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.green,
                child: Container(
                  padding: const EdgeInsets.only(
                      bottom: 25, top: 20, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        child: Text(
                          data[index]["desc"].toString(),
                          style: const TextStyle(
                              color: Colors.black87, fontSize: 20),
                        ),
                      ),
                      Container(
                        width: 120,
                        child: Text(
                          data[index]["type"].toString(),
                          style: const TextStyle(
                              color: Colors.black45, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}