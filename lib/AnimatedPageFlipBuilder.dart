import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedPageFlipBuilder extends StatelessWidget {
  final Animation<double> animation;
  final bool showFrontSide;
  final WidgetBuilder frontBuilder;
  final WidgetBuilder backBuilder;

  AnimatedPageFlipBuilder(
      {required this.animation,
      required this.showFrontSide,
      required this.frontBuilder,
      required this.backBuilder});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final isAnimationHalf = animation.value.abs() < 0.5;
          final child =
              isAnimationHalf ? frontBuilder(context) : backBuilder(context);
          final rotationValue = animation.value * pi;
          final rotationAngle =
              animation.value > 0.5 ? pi - rotationValue : rotationValue;
          var tilt = (animation.value - 0.5).abs() - 0.5;
          tilt *= isAnimationHalf? - 0.03 : 0.03;
          return Transform(
            transform: Matrix4.rotationY(rotationAngle)..setEntry(3, 0, tilt),
            child: child,
            alignment: Alignment.center,
          );
        });
  }
}
