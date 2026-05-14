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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Tris bello bellissimo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> bottoni = List.generate(9, (index) => 'assets/Empty.png');
  String player = Random().nextBool() ? 'assets/X.png' : 'assets/O.png';

  void _handleButtonPress(int index) {
    if (bottoni[index] == 'assets/Empty.png' && !checkWin()) {
      setState(() {
        bottoni[index] = player;
        player = player == 'assets/X.png' ? 'assets/O.png' : 'assets/X.png';
      });
    }
  }

  bool checkWin() {
    return (bottoni[0] == bottoni[1] &&
            bottoni[1] == bottoni[2] &&
            bottoni[0] != 'assets/Empty.png') ||
        (bottoni[3] == bottoni[4] &&
            bottoni[4] == bottoni[5] &&
            bottoni[3] != 'assets/Empty.png') ||
        (bottoni[6] == bottoni[7] &&
            bottoni[7] == bottoni[8] &&
            bottoni[6] != 'assets/Empty.png') ||
        (bottoni[0] == bottoni[3] &&
            bottoni[3] == bottoni[6] &&
            bottoni[0] != 'assets/Empty.png') ||
        (bottoni[1] == bottoni[4] &&
            bottoni[4] == bottoni[7] &&
            bottoni[1] != 'assets/Empty.png') ||
        (bottoni[2] == bottoni[5] &&
            bottoni[5] == bottoni[8] &&
            bottoni[2] != 'assets/Empty.png') ||
        (bottoni[0] == bottoni[4] &&
            bottoni[4] == bottoni[8] &&
            bottoni[0] != 'assets/Empty.png') ||
        (bottoni[2] == bottoni[4] &&
            bottoni[4] == bottoni[6] &&
            bottoni[2] != 'assets/Empty.png');
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
              surfaceTintColor: Colors.white,
              elevation: 12,
            ),
            onPressed: () => _handleButtonPress(index),
            child: Image.asset(bottoni[index]),
          );
        },
      ),
    );
  }
}
