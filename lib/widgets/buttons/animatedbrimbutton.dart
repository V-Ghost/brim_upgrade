import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Animatedbrimbutton extends StatefulWidget {
  double? buttonHeight;
  double? buttonWidth;
  String text;

  Animatedbrimbutton(
      {required this.buttonHeight,
      required this.buttonWidth,
      required this.text});

  @override
  _AnimatedbrimbuttonState createState() => _AnimatedbrimbuttonState();
}

class _AnimatedbrimbuttonState extends State<Animatedbrimbutton> {
  double opacity = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        opacity = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      onPlay: (controller) => controller.repeat(reverse: true),
      effects: [ScaleEffect(duration: 3000.ms, begin: Offset(1.0, 1.5))],
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          width: widget.buttonWidth,
          height: widget.buttonHeight,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.pink,
              width: 2.0,
            ),
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          duration: const Duration(milliseconds: 2000),
          child: Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 3000),
              opacity: opacity,
              child: Text(
                widget.text,
                style: const TextStyle(
                  color: Colors.pink,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
