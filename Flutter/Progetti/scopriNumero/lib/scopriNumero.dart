import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Tris bello bellissimo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _numeroDaIndovinare = 0;
  int _tentativi = 3;
  bool _giocoFinito = false;
  final List<int> _numeri = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  final List<bool> _numeriScoperti = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  //Assegnazione RunTime
  @override
  void initState() {
    super.initState();
    // scegli un indice valido 0..8
    _numeroDaIndovinare = _numeri[Random().nextInt(9)];
  }

  void _handleButtonPress(int index) {
    if (_giocoFinito || _tentativi <= 0) return;

    setState(() {
      _numeriScoperti[index] = true;
      if (checkNumero(index)) {
        _giocoFinito = true;
        print("Hai vinto!!");
      } else if (_tentativi == 0) {
        _giocoFinito = true;
        print("Hai perso...");
      } else {
        print("Sbagliato!");
      }
    });
  }

  bool checkNumero(int index) {
    if (_numeri[index] == _numeroDaIndovinare) {
      return true;
    }
    _tentativi--;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: 9,
        //scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              surfaceTintColor: const Color.fromARGB(255, 121, 93, 220),
              elevation: 12,
            ),
            onPressed:
                (_numeriScoperti[index] || _giocoFinito || _tentativi <= 0)
                ? null
                : () => _handleButtonPress(index),
            child: Text(
              _numeriScoperti[index] ? (_numeri[index]).toString() : "?",
            ),
          );
        },
      ),
    );
  }
}
