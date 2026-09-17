// Samuel Garcia | CECS 453 | Lab 2: Art Space
import 'package:flutter/material.dart';

void main() {
  runApp(const ArtSpaceApp());
}

const cream = Color(0xFFF4EEE4);
const ivory = Color(0xFFFFFCF5);
const lightBrown = Color(0xFFD9C2A8);
const ink = Color(0xFF49392E);
const muted = Color(0xFF786453);

class Album {
  const Album(this.title, this.artist, this.year, this.image);

  final String title;
  final String artist;
  final int year;
  final String image;
}

const albums = [
  Album('Blonde', 'Frank Ocean', 2016, 'assets/images/blonde.webp'),
  Album('Is This It', 'The Strokes', 2001, 'assets/images/is_this_it.png'),
  Album('U', 'underscores', 2026, 'assets/images/u.jpg'),
  Album('Imaginal Disk', 'Magdalena Bay', 2024, 'assets/images/imaginal_disk.png',),
  Album('Melodrama', 'Lorde', 2017, 'assets/images/melodrama.jpg'),
];

class ArtSpaceApp extends StatelessWidget {
  const ArtSpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Digital Art Space",
      debugShowCheckedModeBanner: false,
      home: const AlbumGallery(),
    );
  }
}

class AlbumGallery extends StatefulWidget {
  const AlbumGallery({super.key});

  @override
  State<AlbumGallery> createState() => _AlbumGalleryState();
}

class _AlbumGalleryState extends State<AlbumGallery> {
  int selectedIndex = 0;

  void nextAlbum() {
    setState(() {
      selectedIndex++;

      if (selectedIndex >= albums.length) {
        selectedIndex = 0;
      }
    });
  }

  void previousAlbum() {
    setState(() {
      selectedIndex--;

      if (selectedIndex < 0) {
        selectedIndex = albums.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final album = albums[selectedIndex];

    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Artwork Box
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: ivory,
                  border: Border.all(color: lightBrown),
                ),
                child: Image.asset(
                  album.image,
                  height: 300,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 24),

              // Description
              Text(
                album.title,
                style: const TextStyle(
                  fontSize: 30,
                  color: ink,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                '${album.artist} / ${album.year}',
                style: const TextStyle(
                  fontSize: 16,
                  color: muted,
                ),
              ),

              const SizedBox(height: 24),

              // Controlls
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: previousAlbum,
                      child: const Text('Previous'),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Text(
                    '${selectedIndex + 1} / ${albums.length}',
                    style: const TextStyle(
                      color: muted,
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: nextAlbum,
                      child: const Text('Next'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}