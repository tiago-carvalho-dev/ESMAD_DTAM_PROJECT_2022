import 'package:flutter/material.dart';
import 'package:animated_class/implicit_animation.dart';
import 'package:animated_class/tween_animation.dart';
import 'package:animated_class/built_in_animation.dart';
import 'package:animated_class/animated_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Animations"),
          centerTitle: true,
        ),
        body: AnimatedWidgetExample(),
      ),
    );
  }
}
