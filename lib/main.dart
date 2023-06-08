import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Flash',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FutureFlash(),
    );
  }
}

class FutureFlash extends StatefulWidget {
  const FutureFlash({super.key});

  @override
  State<FutureFlash> createState() => _FutureFlashState();
}

class _FutureFlashState extends State<FutureFlash> {
  late Future<String> _future;

  @override
  void initState() {
    super.initState();
    _future = Future.delayed(const Duration(seconds: 1)).then((_) => 'Hello World');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Tooltip(
        message: 'Hello World!',
        child: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            return Text('state: ${snapshot.connectionState}');
          },
        ),
      ),
    );
  }
}
