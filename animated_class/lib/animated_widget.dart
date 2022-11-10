import 'package:flutter/material.dart';

class AnimatedWidgetExample extends StatefulWidget {
  @override
  State<AnimatedWidgetExample> createState() => _AnimatedWidgetExampleState();
}

class _AnimatedWidgetExampleState extends State<AnimatedWidgetExample> {
  final Image ufo = Image.asset('assets/ufo.png');

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        Container(
          color: Colors.blue[900],
        ),
        ClipPath(
          clipper: const BeamClipper(),
          child: Container(
            height: 1000,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 1.5,
                colors: [
                  Colors.yellow,
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 140),
          child: ufo,
        )
      ],
    );
  }
}

class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  /// Return false always because we always clip the same area.
  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}

/// Animated Builder example

// class _AnimatedWidgetExampleState extends State<AnimatedWidgetExample>
//     with SingleTickerProviderStateMixin {
//   final Image ufo = Image.asset('assets/ufo.png');
//   late AnimationController _animationController;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 5),
//     )..repeat();
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: AlignmentDirectional.topCenter,
//       children: <Widget>[
//         Container(
//           color: Colors.blue[900],
//         ),
//         AnimatedBuilder(
//           animation: _animationController,
//           builder: (_, __) {
//             return ClipPath(
//               clipper: const BeamClipper(),
//               child: Container(
//                 height: 1000,
//                 decoration: BoxDecoration(
//                   gradient: RadialGradient(
//                       radius: 1.5,
//                       colors: [
//                         Colors.yellow,
//                         Colors.transparent,
//                       ],
//                       stops: [0, _animationController.value]
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//         Container(
//           margin: EdgeInsets.only(top: 140),
//           child: ufo,
//         )
//       ],
//     );
//   }
// }

/// AnimatedWidget example

// class AnimatedWidgetExample extends StatefulWidget {
//   @override
//   State<AnimatedWidgetExample> createState() => _AnimatedWidgetExampleState();
// }
//
// class _AnimatedWidgetExampleState extends State<AnimatedWidgetExample>
//     with SingleTickerProviderStateMixin {
//   final Image ufo = Image.asset('assets/ufo.png');
//   late AnimationController _animationController;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 5),
//     )..repeat();
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: AlignmentDirectional.topCenter,
//       children: <Widget>[
//         Container(
//           color: Colors.blue[900],
//         ),
//         BeamTransition(animation: _animationController),
//         Container(
//           margin: EdgeInsets.only(top: 140),
//           child: ufo,
//         )
//       ],
//     );
//   }
// }

// class BeamTransition extends AnimatedWidget {
//   final AnimationController _animationController;
//
//   const BeamTransition({
//     Key? key, required AnimationController animation
//   }) : _animationController = animation, super(key: key, listenable: animation);
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipPath(
//       clipper: const BeamClipper(),
//       child: Container(
//         height: 1000,
//         decoration: BoxDecoration(
//           gradient: RadialGradient(
//               radius: 1.5,
//               colors: [
//                 Colors.yellow,
//                 Colors.transparent,
//               ],
//               stops: [0, _animationController.value]
//           ),
//         ),
//       ),
//     );
//   }
// }
