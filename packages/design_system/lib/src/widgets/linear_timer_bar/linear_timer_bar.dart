import 'dart:async';

import 'package:flutter/material.dart';

import '../../../design_system_export.dart';

class LinearTimerBar extends StatefulWidget {
  const LinearTimerBar({
    required this.duration,
    super.key,
    this.rounded = false,
    this.color,
  });

  final Duration duration;
  final bool rounded;
  final Color? color;

  @override
  State<LinearTimerBar> createState() => _LinearTimerBarState();
}

class _LinearTimerBarState extends State<LinearTimerBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(begin: 1, end: 0).animate(_controller)
      ..addListener(() => setState(() {}));
    unawaited(_controller.forward());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      borderRadius: BorderRadius.all(
        widget.rounded ? DSProperty.radiusXSmall : Radius.zero,
      ),
      value: _animation.value,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      valueColor: AlwaysStoppedAnimation<Color>(
        widget.color ?? Theme.of(context).primaryColor,
      ),
    );
  }
}
