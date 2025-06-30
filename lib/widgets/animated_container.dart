import 'package:flutter/material.dart';

class AnimatedCounter extends StatelessWidget {
  final int value;
  final String suffix;
  final Duration duration;

  const AnimatedCounter({
    super.key,
    required this.value,
    this.suffix = '',
    this.duration = const Duration(seconds: 2),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: value),
      duration: duration,
      builder: (context, value, child) {
        return Text(
          '$value$suffix',
          style: const TextStyle(
            color: Color(0xFF0c7ff2),
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
