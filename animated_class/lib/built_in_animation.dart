import 'package:flutter/material.dart';

class BuiltInAnimation extends StatefulWidget {
  const BuiltInAnimation({Key? key}) : super(key: key);

  @override
  State<BuiltInAnimation> createState() => _BuiltInAnimationState();
}

class _BuiltInAnimationState extends State<BuiltInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      alignment: Alignment.center,
      turns: _animationController,
      child: Center(
        child: Image.asset(
          "assets/star.png",
          color: Colors.blue,
          width: 200,
          height: 200,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
