import 'package:flutter/material.dart';
import 'package:portfolio/core/providers/animated_provider.dart';
import 'package:portfolio/core/utils/colors.dart';
import 'package:provider/provider.dart';

class HomeButton extends StatefulWidget {
  const HomeButton({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final void Function()? onTap;

  @override
  State<HomeButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (isHover) {
        setState(() {
          _isHover = isHover;
        });
      },
      borderRadius: BorderRadius.circular(50),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: !_isHover ? secondaryColor : onPrimary,
          border: Border.all(
            width: 1,
            color: onPrimary,
          ),
        ),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 16,
              color: _isHover ? secondaryColor : onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
