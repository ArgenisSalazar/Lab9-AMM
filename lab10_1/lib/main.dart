import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Map<String, dynamic>> items = [
    {
      'name': 'Pizza',
      'image': 'assets/images/food.jpg',
      'category': 'food',
    },
    {
      'name': 'Perro',
      'image': 'assets/images/animal.jpg',
      'category': 'animal',
    },
    {
      'name': 'Machu Picchu',
      'image': 'assets/images/place.jpg',
      'category': 'place',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(items[index]['image']),
                  radius: 25,
                ),
                title: Text(
                  items[index]['name'],
                  style: TextStyle(
                    fontFamily: getFontFamily(items[index]['category']),
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              ),
            );
          },
        ),
      ),
    );
  }

  String getFontFamily(String category) {
    switch (category) {
      case 'food':
        return 'OpenSans';
      case 'animal':
        return 'Lato';
      case 'place':
        return 'Ubuntu';
      default:
        return 'Sans';
    }
  }
}
