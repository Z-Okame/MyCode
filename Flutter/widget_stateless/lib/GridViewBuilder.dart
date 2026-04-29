import 'package:flutter/material.dart';

/// Dimostrazione Layout Grid con GridView e costruttore GridView.builder
void main() {
  runApp(DimostrazioneBuilder());
}

class DimostrazioneBuilder extends StatelessWidget {
  const DimostrazioneBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Esempio GridView - GridView.builder';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(title: const Text(title)),
        body: GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //3 colonne
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Contenitore(colore: 600, testo: 'Cella ${index + 1}');
          },
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
