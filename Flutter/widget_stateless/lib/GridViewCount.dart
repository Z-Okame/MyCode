import 'package:flutter/material.dart';

/// Dimostrazione  GridView.count
void main() {
  runApp(DimostrazioneCount());
}

class DimostrazioneCount extends StatelessWidget {
  const DimostrazioneCount({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Esempio Grid - GridView.count';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(title: const Text(title)),
        body: GridView.count(
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Contenitore(colore: 300, testo: 'Cella 1'),
            Contenitore(
              colore: 300,
              testo: 'Qui sotto c’è un’immagine caricata dal web',
            ),
            Contenitore(colore: 600, testo: 'Goku'),

            Container(
              padding: const EdgeInsets.all(8),
              color: const Color.fromARGB(255, 208, 141, 35),
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/it/4/48/Son_Goku_-_Dragon_Ball_Kai.png',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              color: Colors.teal[500],
              child: const Center(
                child: Text(
                  'Mi piace Goku',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: const Color.fromARGB(255, 0, 0, 0),
              child: Image.network(
                'https://img.oggettifantastici.com/2025/10/x_btn69290.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Contenitore extends StatelessWidget {
  final int colore;
  final String testo;

  const Contenitore({super.key, required this.colore, required this.testo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[colore],
      child: Center(
        child: Text(testo, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
