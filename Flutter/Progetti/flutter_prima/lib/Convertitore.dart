import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextField Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePageProva(title: 'Convertitore Euro -> Dollari'),
    );
  }
}

class HomePageProva extends StatefulWidget {
  const HomePageProva({super.key, required this.title});

  final String title;

  @override
  _HomePageProvaState createState() => _HomePageProvaState();
}

class _HomePageProvaState extends State<HomePageProva> {
  String _msg = "";
  // servirà per accedere dinamicamente (runtime) al widget TextField
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              // il widget sarà accessibile con reference assegnato _controller
              controller: _controller,
              textAlign: .center,
            ),
            const Divider(),
            ElevatedButton(
              child: const Text('Converti'),
              onPressed: () {
                setState(() {
                  _msg = (double.parse(_controller.text) * 1.17).toString();
                });
              },
            ),
            Text('Valore convertito: $_msg \$'),
          ],
        ),
      ),
    );
  }
}
