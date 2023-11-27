import 'package:flutter/material.dart';
import 'package:susten_app/src/core/theme/theme.dart';

class Bar extends StatefulWidget {
  final BoxConstraints constraints;
  final int percentage;

  const Bar({super.key, required this.constraints, required this.percentage});

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
        _expandAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height =
        (widget.constraints.maxHeight * 0.35) * (widget.percentage / 100);

    return SizeTransition(
      sizeFactor: _expandAnimation,
      axis: Axis.vertical,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(widget.constraints.maxWidth * 0.03)),
        child: Container(
          width: widget.constraints.maxWidth * 0.1,
          height: height,
          color: primaryColor,
        ),
      ),
    );
  }
}
