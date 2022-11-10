import 'package:flutter/material.dart';

class TweenAnimationExample extends StatefulWidget {
  const TweenAnimationExample({Key? key}) : super(key: key);

  @override
  State<TweenAnimationExample> createState() => _TweenAnimationExampleState();
}

class _TweenAnimationExampleState extends State<TweenAnimationExample> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.0, end: 100.0),
        duration: Duration(seconds: 5),
        builder: (_, double radius, __) {
          return Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(radius),
            ),
            child: const Center(
              child: Text(
                "Some Example",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// child: TweenAnimationBuilder(
//   tween: Tween(begin: 0.0, end: 100.0),
//   duration: Duration(seconds: 3),
//   builder: (_, double radius, __) {
