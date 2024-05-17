import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galería de Imágenes',
      home: GalleryPage(),
    );
  }
}

class GalleryPage extends StatelessWidget {
  GalleryPage({super.key});

  final List<Map<String, String>> images = [
    {'path': 'assets/images/imagen-1.png', 'type': 'PNG'},
    {'path': 'assets/images/imagen-2.jpeg', 'type': 'JPEG'},
    {'path': 'assets/images/imagen-3.svg', 'type': 'SVG'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galería de Imágenes'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.map((image) => imageWidget(context, image)).toList(),
        ),
      ),
    );
  }

  Widget imageWidget(BuildContext context, Map<String, String> image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            width: 150, // Ancho fijo para todas las imágenes
            height: 150, // Altura fija para todas las imágenes
            child: image['type'] == 'SVG'
                ? SvgPicture.asset(
                    image['path']!,
                    fit: BoxFit.cover, // Ajusta la imagen dentro del contenedor
                  )
                : Image.asset(
                    image['path']!,
                    fit: BoxFit.cover, // Ajusta la imagen dentro del contenedor
                  ),
          ),
          Text(
            image['type'] ?? '',
            style: TextStyle(
              fontFamily: getFontFamily(image['type']),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  String getFontFamily(String? type) {
    switch (type) {
      case 'PNG':
        return 'Arial';
      case 'JPEG':
        return 'Times New Roman';
      case 'SVG':
        return 'Roboto';
      default:
        return 'Sans';
    }
  }
}
