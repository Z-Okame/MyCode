import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Impiccato',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 55, 27, 213),
        ),
        useMaterial3: true,
      ),
      home: const Impiccato(),
    );
  }
}

class Impiccato extends StatefulWidget {
  const Impiccato({super.key});

  @override
  State<Impiccato> createState() => _ImpiccatoState();
}

class _ImpiccatoState extends State<Impiccato> {
  final _controller = TextEditingController();
  late String _parolascelta;
  String _image = 'assets/0.png';
  late String _parolaDefault;
  int counter = 0;

  final List<String> _parole = [
    "albero",
    "piano",
    "nota",
    "casa",
    "amore",
    "stella",
    "gatto",
    "coccodrillo",
    "lasagna",
    "supercaligrafilistichespiralitoso",
  ];

  @override
  void initState() {
    super.initState();
    _parolascelta = _parole[Random().nextInt(_parole.length)];
    _parolaDefault = List.filled(_parolascelta.length, '_').join(' ');
    _image = 'assets/0.png';
  }

  void aggiornaImmagine() {
    setState(() {
      counter++;
      _image = 'assets/$counter.png';
    });
  }

  void checkWin() {
    if (!_parolaDefault.contains('_')) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Hai vinto!'),
          content: Text('La parola era: $_parolascelta'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                exit(0);
              },
              child: const Text('Esci'),
            ),
          ],
        ),
      );
    }
  }

  void checkParola() {
    String text = _controller.text.trim().toLowerCase();
    if (text.isEmpty) return;

    // Full-word attempt
    if (text.length == _parolascelta.length) {
      if (text == _parolascelta) {
        setState(() {
          // show full word with spaces between letters
          _parolaDefault = _parolascelta.split('').join(' ');
        });
      } else {
        aggiornaImmagine();
      }
    } else if (text.length == 1) {
      // Single-letter attempt
      if (_parolascelta.contains(text)) {
        List<String> temp = _parolaDefault.split(' ');
        for (int i = 0; i < _parolascelta.length; i++) {
          if (_parolascelta[i] == text) {
            temp[i] = text;
          }
        }
        setState(() {
          _parolaDefault = temp.join(' ');
        });
      } else {
        aggiornaImmagine();
      }
    } else {
      aggiornaImmagine();
    }
    checkWin();
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gioco Dell'Impiccato")),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(_image),
                Text(_parolaDefault),
                SizedBox(height: 12),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(16)),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          labelText: 'Inserisci una parola o una lettera',
                        ),
                        onSubmitted: (_) => checkParola(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
