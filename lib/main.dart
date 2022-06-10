import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

/// Root of application
class Main extends StatelessWidget {
  ///Root contructor
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
      ),
      home: const _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  const _MyHomePage({Key? key}) : super(key: key);

  @override
  State<_MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  final Random _random = Random();

  ///Init max range for Randor (will return from 0 to 255)
  final int _rangeColor = 256;

  Color? _color;

  @override
  ///Set default Color after app is running
  void initState() {
    _color = Color.fromRGBO(
      _random.nextInt(_rangeColor),
      _random.nextInt(_rangeColor),
      _random.nextInt(_rangeColor),
      _random.nextDouble(),
    );
    super.initState();
  }

  /// Update color field after click on Screen
  void _changeColor() {
    setState(() {
      _color = Color.fromRGBO(
        _random.nextInt(_rangeColor),
        _random.nextInt(_rangeColor),
        _random.nextInt(_rangeColor),
        _random.nextDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _changeColor,
        child: Container(
          color: _color,
          child: Center(
            child: Text(
              'Hey there',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
      ),
    );
  }
}
