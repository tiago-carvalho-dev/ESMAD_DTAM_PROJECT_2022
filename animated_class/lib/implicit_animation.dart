import 'package:flutter/material.dart';

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimation> createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  var _bigger = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
            width: _bigger ? 100 : 500,
            child: Image.asset("assets/star.png"),
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.purple, Colors.transparent],
                    stops: [ _bigger ? 0.2 : 0.5, 1.0]
                )
            ),
          ),
          ElevatedButton(
            onPressed: () => {
              setState(() {
                _bigger = !_bigger;
              })
            },
            child: const Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}