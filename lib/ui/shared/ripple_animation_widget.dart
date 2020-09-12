import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

import 'circle_painter.dart';
import 'curve_wave.dart';

class RipplesAnimationWidget extends StatefulWidget {
  const RipplesAnimationWidget({
    Key key,
    this.size = 100.0,
    this.color = Colors.white,
    this.onPressed,
    this.child,
  }) : super(key: key);
  final double size;
  final Color color;
  final Widget child;
  final VoidCallback onPressed;

  @override
  _RipplesAnimationWidgetState createState() => _RipplesAnimationWidgetState();
}

class _RipplesAnimationWidgetState extends State<RipplesAnimationWidget> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(
        _controller,
        color: widget.color,
      ),
      child: SizedBox(
        width: 80,
        height: 80,
        child: _buildIcon(),
      ),
    );
  }

  Widget _buildIcon() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.size),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: <Color>[widget.color, Color.lerp(widget.color, Colors.black, .05)],
            ),
          ),
          child: ScaleTransition(
              scale: Tween(begin: 0.95, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: const CurveWave(),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.calendar_today_sharp,
                  size: 20,
                  color: Colors.blue,
                ),
              )),
        ),
      ),
    );
  }
}
