import 'package:flutter/material.dart';
import 'package:susten_app/src/core/enums/water_graph_bar_style.dart';
import 'package:susten_app/src/core/theme/theme.dart';

class WaterGraphBar extends StatefulWidget {
  final BoxConstraints graphConstraints;
  final double consumption;
  final WaterGraphBarStyle? barStyle;

  const WaterGraphBar({
    Key? key,
    required this.graphConstraints,
    required this.consumption,
    this.barStyle = WaterGraphBarStyle.PRIMARY,
  }) : super(key: key);

  @override
  _WaterGraphBarState createState() => _WaterGraphBarState();
}

class _WaterGraphBarState extends State<WaterGraphBar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _expandAnimation;

  late double porcentagem;

  @override
  void initState() {
    super.initState();
    porcentagem = (widget.consumption * 100) / 5000;
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
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(widget.graphConstraints.maxWidth * 0.02),
      ),
      child: SizeTransition(
        axis: Axis.vertical,
        sizeFactor: _expandAnimation,
        child: Container(
          height: (widget.graphConstraints.maxHeight -
                  widget.graphConstraints.maxHeight * 0.1) *
              (porcentagem / 100),
          width: widget.graphConstraints.maxWidth * 0.1,
          decoration: BoxDecoration(
            color: widget.barStyle == WaterGraphBarStyle.PRIMARY
                ? primaryColor
                : const Color(0xFFE5E5E5),
          ),
        ),
      ),
    );
  }
}
