import 'dart:math' as math;
import 'package:flutter/material.dart';


import 'dart:math' as math;
import 'package:flutter/material.dart';

class StarField extends StatefulWidget {
  /// base number of stars for a medium-sized screen; scaled by area
  final int baseStars;

  /// whether stars should twinkle
  final bool twinkle;

  /// a subtle tint for the background (defaults to dark grey)
  final Color backgroundStart;
  final Color backgroundEnd;

  /// controls overall glow strength (0 = no glow). Try 0.0, 0.03, 0.06, 0.12
  final double glowIntensity;

  const StarField({
    Key? key,
    this.baseStars = 160,
    this.twinkle = true,
    this.backgroundStart = const Color.fromARGB(255, 0, 0, 0),
    this.backgroundEnd = const Color.fromARGB(255, 0, 0, 0),
    this.glowIntensity = 0.12, // smaller by default than before
  }) : super(key: key);

  @override
  State<StarField> createState() => _StarFieldState();
}

class _StarFieldState extends State<StarField>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final math.Random _rng = math.Random();

  late List<_Star> _stars;
  late Size _lastSize;
  DateTime? _lastTick;

  @override
  void initState() {
    super.initState();

    // provide a duration so repeat() has a period to use.
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )
      ..addListener(_onTick)
      ..repeat();

    _stars = [];
    _lastSize = Size.zero;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTick() {
    final now = DateTime.now();
    final last = _lastTick ?? now;
    final dt = now.difference(last).inMilliseconds / 1000.0;
    _lastTick = now;

    if (dt <= 0) return;

    // update star positions
    for (final s in _stars) {
      s.pos = Offset(
        s.pos.dx + s.velocity.dx * dt,
        s.pos.dy + s.velocity.dy * dt,
      );

      // wrap-around
      final w = _lastSize.width;
      final h = _lastSize.height;
      double x = s.pos.dx;
      double y = s.pos.dy;
      if (x < -s.radius) x = w + s.radius;
      if (x > w + s.radius) x = -s.radius;
      if (y < -s.radius) y = h + s.radius;
      if (y > h + s.radius) y = -s.radius;
      s.pos = Offset(x, y);

      // twinkle (phase advance)
      if (widget.twinkle) {
        s.twinklePhase += s.twinkleSpeed * dt;
      }
    }

    // trigger repaint
    if (mounted) setState(() {});
  }

  void _maybeGenerateStars(Size size) {
    if (_lastSize == size && _stars.isNotEmpty) return;
    _lastSize = size;

    // scale stars by area, clamp
    final areaScale = (size.width * size.height) / (1366.0 * 768.0);
    final count = (widget.baseStars * areaScale).clamp(30, 450).toInt();

    _stars = List.generate(count, (i) {
      final dx = _rng.nextDouble() * size.width;
      final dy = _rng.nextDouble() * size.height;
      final radius = (_rng.nextDouble() * 1.8) +
          (_rng.nextDouble() < 0.15 ? 1.8 : 0.2); // more small stars, some big
      final speed = (_rng.nextDouble() * 30) + 6; // px/sec
      final angle = _rng.nextDouble() * math.pi * 2;
      final velocity = Offset(math.cos(angle) * speed,
          math.sin(angle) * speed * 0.6); // slight bias
      final twinkleSpeed = (_rng.nextDouble() * 2) + 0.5;
      final baseAlpha = 0.35 + _rng.nextDouble() * 0.65;
      final color = _rng.nextDouble() < 0.06
          ? Colors.blueAccent.shade100 // occasional bluish star
          : _rng.nextDouble() < 0.04
              ? Colors.amber.shade200 // warm stars
              : Colors.white;
      return _Star(
        pos: Offset(dx, dy),
        radius: radius,
        velocity: velocity,
        twinklePhase: _rng.nextDouble() * math.pi * 2,
        twinkleSpeed: twinkleSpeed,
        baseAlpha: baseAlpha,
        color: color,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final size = Size(constraints.maxWidth, constraints.maxHeight);
      _maybeGenerateStars(size);

      return RepaintBoundary(
        child: CustomPaint(
          size: size,
          painter: _StarPainter(
            stars: _stars,
            time: _lastTick ?? DateTime.now(),
            twinkle: widget.twinkle,
            backgroundStart: widget.backgroundStart,
            backgroundEnd: widget.backgroundEnd,
            glowIntensity: widget.glowIntensity,
          ),
        ),
      );
    });
  }
}

class _Star {
  Offset pos;
  final double radius;
  Offset velocity;
  double twinklePhase;
  final double twinkleSpeed;
  final double baseAlpha;
  final Color color;

  _Star({
    required this.pos,
    required this.radius,
    required this.velocity,
    required this.twinklePhase,
    required this.twinkleSpeed,
    required this.baseAlpha,
    required this.color,
  });
}

class _StarPainter extends CustomPainter {
  final List<_Star> stars;
  final DateTime time;
  final bool twinkle;
  final Color backgroundStart;
  final Color backgroundEnd;
  final double glowIntensity;

  _StarPainter({
    required this.stars,
    required this.time,
    required this.twinkle,
    required this.backgroundStart,
    required this.backgroundEnd,
    required this.glowIntensity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // background gradient (subtle)
    final rect = Offset.zero & size;
    final bgPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [backgroundStart, backgroundEnd],
        stops: [0.0, 1.0],
      ).createShader(rect);
    canvas.drawRect(rect, bgPaint);

    final now = time.millisecondsSinceEpoch / 1000.0;

    // NOTE: removed faint nebula/“moon” circles here to avoid static shade.

    // draw stars
    for (final s in stars) {
      final phase = twinkle
          ? (math.sin(s.twinklePhase + now * s.twinkleSpeed) * 0.5 + 0.5)
          : 1.0;
      // reduce overall max brightness slightly so circles are more subtle
      final alpha = (s.baseAlpha * phase * 0.9).clamp(0.02, 0.9);

      // Core paint: keep it sharp by reducing the blur radius
      final paint = Paint()
        ..color = s.color.withOpacity(alpha)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, s.radius * 0.45);

      // draw core (brighter)
      canvas.drawCircle(s.pos, s.radius, paint);

      // Glow: use user-controlled intensity and smaller blur radius.
      if (glowIntensity > 0.0) {
        final glowPaint = Paint()
          ..color = s.color.withOpacity(alpha * glowIntensity)
          ..maskFilter =
              MaskFilter.blur(BlurStyle.normal, s.radius * 1.6); // smaller blur
        canvas.drawCircle(s.pos, s.radius * 1.6, glowPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _StarPainter oldDelegate) => true;
}
// class StarField extends StatefulWidget {
//   /// base number of stars for a medium-sized screen; scaled by area
//   final int baseStars;

//   /// whether stars should twinkle
//   final bool twinkle;

//   /// a subtle tint for the background (defaults to dark grey)
//   final Color backgroundStart;
//   final Color backgroundEnd;

//   const StarField({
//     Key? key,
//     this.baseStars = 160,
//     this.twinkle = true,
//     this.backgroundStart = const Color(0xFF0B0F14),
//     this.backgroundEnd = const Color(0xFF1A1F24),
//   }) : super(key: key);

//   @override
//   State<StarField> createState() => _StarFieldState();
// }

// class _StarFieldState extends State<StarField>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;
//   final math.Random _rng = math.Random();

//   late List<_Star> _stars;
//   late Size _lastSize;
//   DateTime? _lastTick;

//   @override
//   void initState() {
//     super.initState();

//     // <<< FIX: provide a duration so repeat() has a period to use.
//     // Using a short duration (1s) is fine since we only use the controller
//     // to get continuous frame callbacks via addListener.
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     )
//       ..addListener(_onTick)
//       ..repeat();

//     _stars = [];
//     _lastSize = Size.zero;
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _onTick() {
//     final now = DateTime.now();
//     final last = _lastTick ?? now;
//     final dt = now.difference(last).inMilliseconds / 1000.0;
//     _lastTick = now;

//     if (dt <= 0) return;

//     // update star positions
//     for (final s in _stars) {
//       s.pos = Offset(
//         s.pos.dx + s.velocity.dx * dt,
//         s.pos.dy + s.velocity.dy * dt,
//       );

//       // wrap-around
//       final w = _lastSize.width;
//       final h = _lastSize.height;
//       double x = s.pos.dx;
//       double y = s.pos.dy;
//       if (x < -s.radius) x = w + s.radius;
//       if (x > w + s.radius) x = -s.radius;
//       if (y < -s.radius) y = h + s.radius;
//       if (y > h + s.radius) y = -s.radius;
//       s.pos = Offset(x, y);

//       // twinkle (phase advance)
//       if (widget.twinkle) {
//         s.twinklePhase += s.twinkleSpeed * dt;
//       }
//     }

//     // trigger repaint
//     if (mounted) setState(() {});
//   }

//   void _maybeGenerateStars(Size size) {
//     if (_lastSize == size && _stars.isNotEmpty) return;
//     _lastSize = size;

//     // scale stars by area, clamp
//     final areaScale = (size.width * size.height) / (1366.0 * 768.0);
//     final count = (widget.baseStars * areaScale).clamp(30, 450).toInt();

//     _stars = List.generate(count, (i) {
//       final dx = _rng.nextDouble() * size.width;
//       final dy = _rng.nextDouble() * size.height;
//       final radius = (_rng.nextDouble() * 1.8) +
//           (_rng.nextDouble() < 0.15 ? 1.8 : 0.2); // more small stars, some big
//       final speed = (_rng.nextDouble() * 30) + 6; // px/sec
//       final angle = _rng.nextDouble() * math.pi * 2;
//       final velocity = Offset(math.cos(angle) * speed,
//           math.sin(angle) * speed * 0.6); // slight bias
//       final twinkleSpeed = (_rng.nextDouble() * 2) + 0.5;
//       final baseAlpha = 0.35 + _rng.nextDouble() * 0.65;
//       final color = _rng.nextDouble() < 0.06
//           ? Colors.blueAccent.shade100 // occasional bluish star
//           : _rng.nextDouble() < 0.04
//               ? Colors.amber.shade200 // warm stars
//               : Colors.white;
//       return _Star(
//         pos: Offset(dx, dy),
//         radius: radius,
//         velocity: velocity,
//         twinklePhase: _rng.nextDouble() * math.pi * 2,
//         twinkleSpeed: twinkleSpeed,
//         baseAlpha: baseAlpha,
//         color: color,
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       final size = Size(constraints.maxWidth, constraints.maxHeight);
//       _maybeGenerateStars(size);

//       return RepaintBoundary(
//         child: CustomPaint(
//           size: size,
//           painter: _StarPainter(
//             stars: _stars,
//             time: _lastTick ?? DateTime.now(),
//             twinkle: widget.twinkle,
//             backgroundStart: widget.backgroundStart,
//             backgroundEnd: widget.backgroundEnd,
//           ),
//         ),
//       );
//     });
//   }
// }

// class _Star {
//   Offset pos;
//   final double radius;
//   Offset velocity;
//   double twinklePhase;
//   final double twinkleSpeed;
//   final double baseAlpha;
//   final Color color;

//   _Star({
//     required this.pos,
//     required this.radius,
//     required this.velocity,
//     required this.twinklePhase,
//     required this.twinkleSpeed,
//     required this.baseAlpha,
//     required this.color,
//   });
// }

// class _StarPainter extends CustomPainter {
//   final List<_Star> stars;
//   final DateTime time;
//   final bool twinkle;
//   final Color backgroundStart;
//   final Color backgroundEnd;

//   _StarPainter({
//     required this.stars,
//     required this.time,
//     required this.twinkle,
//     required this.backgroundStart,
//     required this.backgroundEnd,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     // background gradient (subtle)
//     final rect = Offset.zero & size;
//     final bgPaint = Paint()
//       ..shader = LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         colors: [backgroundStart, backgroundEnd],
//         stops: [0.0, 1.0],
//       ).createShader(rect);
//     canvas.drawRect(rect, bgPaint);

//     final now = time.millisecondsSinceEpoch / 1000.0;

//     // draw faint nebula clouds (subtle)
//     final cloudPaint = Paint()..color = Colors.white.withOpacity(0.015);
//     final cloudRadius = math.min(size.width, size.height) * 0.9;
//     canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.25),
//         cloudRadius * 0.45, cloudPaint);
//     canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.7),
//         cloudRadius * 0.35, cloudPaint);

//     // draw stars
//     for (final s in stars) {
//       final phase = twinkle
//           ? (math.sin(s.twinklePhase + now * s.twinkleSpeed) * 0.5 + 0.5)
//           : 1.0;
//       final alpha = (s.baseAlpha * phase).clamp(0.03, 1.0);
//       final paint = Paint()
//         ..color = s.color.withOpacity(alpha)
//         ..maskFilter = MaskFilter.blur(BlurStyle.normal, s.radius * 0.8);

//       // draw core (brighter)
//       canvas.drawCircle(s.pos, s.radius, paint);

//       // small glow
//       final glowPaint = Paint()
//         ..color = s.color.withOpacity(alpha * 0.18)
//         ..maskFilter = MaskFilter.blur(BlurStyle.normal, s.radius * 3);
//       canvas.drawCircle(s.pos, s.radius * 2.4, glowPaint);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant _StarPainter oldDelegate) => true;
// }
