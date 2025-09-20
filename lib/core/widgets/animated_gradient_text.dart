import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimateGradientText extends StatelessWidget {
  const AnimateGradientText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShaderMask(
        shaderCallback: (bounds) {
          return const LinearGradient(
            colors: [
              Color(0xFFE0E0E0), // light grey
              Color(0xFFFFFFFF), // white
              Color(0xFFB0B0B0), // medium grey
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
        },
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: Colors.white, // necessary for ShaderMask
            height: 1.3,
          ),
          textAlign: TextAlign.center,
        ),
      )
          // subtle shimmer animation
          .animate(onPlay: (controller) => controller.repeat())
          .shimmer(
            duration: 2.seconds,
            color: Color(0xFFE0E0E0), // subtle highlight
          ),
    );
  }
}
