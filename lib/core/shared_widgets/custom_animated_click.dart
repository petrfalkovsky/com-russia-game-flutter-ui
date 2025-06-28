import 'package:flutter/widgets.dart';

class TapAnimation extends StatefulWidget {
  final Widget child;
  final double begin, end;
  final Duration beginDuration, endDuration;
  final Function()? onTap;
  final Curve beginCurve, endCurve;
  final HitTestBehavior behavior;

  const TapAnimation({
    super.key,
    required this.child,
    this.onTap,
    this.begin = 1.0,
    this.end = 0.92,
    this.beginDuration = const Duration(milliseconds: 20),
    this.endDuration = const Duration(milliseconds: 130),
    this.beginCurve = Curves.decelerate,
    this.endCurve = Curves.fastOutSlowIn,
    this.behavior = HitTestBehavior.deferToChild,
  });

  @override
  State<StatefulWidget> createState() => _TapAnimationState();
}

class _TapAnimationState extends State<TapAnimation>
    with SingleTickerProviderStateMixin<TapAnimation> {
  AnimationController? _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.endDuration,
      value: 1.0,
      reverseDuration: widget.beginDuration,
    );
    _animation = Tween(begin: widget.end, end: widget.begin).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: widget.beginCurve,
        reverseCurve: widget.endCurve,
      ),
    );
    _controller?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: widget.behavior,
      onTap: () async {
        if (widget.onTap != null) {
          await _controller?.reverse();
          await _controller?.forward();
          await widget.onTap!();
        }
      },
      onTapDown: (_) => _controller?.reverse(),
      onTapUp: (_) => _controller?.forward(),
      onTapCancel: () => _controller?.forward(),
      child: ScaleTransition(scale: _animation, child: widget.child),
    );
  }

  @override
  void dispose() {
    _controller?.stop();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }
}
