import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LeftToRightAnimation extends StatelessWidget {
  final Widget child;
  final Duration delay;
  const LeftToRightAnimation(
      {Key? key, required this.child, required this.delay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child
        .animate(delay: delay)
        .fade(duration: 1000.ms)
        .move(begin: const Offset(-100, 0));
  }
}
