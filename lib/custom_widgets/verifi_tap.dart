import 'dart:async';

import 'package:flutter/material.dart';

class VerifiTap extends StatefulWidget {
  final Widget child;
  final Function onTap;
  VerifiTap({@required this.child, this.onTap});
  @override
  _VerifiTapState createState() => _VerifiTapState();
}

class _VerifiTapState extends State<VerifiTap>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _scaleAnimation;
  Duration duration = const Duration(milliseconds: 80);
  double _opacity = 1;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: duration);
    _scaleAnimation =
        Tween<double>(begin: 1, end: 0.94).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: duration,
      opacity: _opacity,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: GestureDetector(
          onTap: () {
            _animationController.forward();
            setState(() {
              _opacity = 0.5;
            });
            Timer(Duration(milliseconds: 90), () {
              setState(() {
                _opacity = 1;
              });
              _animationController.reverse();
              Timer(Duration(milliseconds: 90), () {
                widget.onTap();
              });
            });
          },
          child: widget.child,
        ),
      ),
    );
  }
}
