import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomPerformanceOverlay extends StatefulWidget {
  final Widget child;
  final bool enabled;

  const CustomPerformanceOverlay({
    super.key,
    required this.child,
    this.enabled = kDebugMode,
  });

  @override
  State<CustomPerformanceOverlay> createState() => _CustomPerformanceOverlayState();
}

class _CustomPerformanceOverlayState extends State<CustomPerformanceOverlay>
    with WidgetsBindingObserver {
  int _frameCount = 0;
  int _droppedFrames = 0;
  DateTime _lastFrameTime = DateTime.now();
  double _fps = 0.0;

  @override
  void initState() {
    super.initState();
    if (widget.enabled) {
      WidgetsBinding.instance.addObserver(this);
      _startFpsCounter();
    }
  }

  @override
  void dispose() {
    if (widget.enabled) {
      WidgetsBinding.instance.removeObserver(this);
    }
    super.dispose();
  }

  void _startFpsCounter() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _updateFps();
        // Reduce frequency of FPS updates to improve performance
        Future.delayed(const Duration(milliseconds: 100), () {
          if (mounted) {
            _startFpsCounter();
          }
        });
      }
    });
  }

  void _updateFps() {
    final now = DateTime.now();
    final frameTime = now.difference(_lastFrameTime);
    _lastFrameTime = now;
    _frameCount++;

    // Calculate FPS
    if (frameTime.inMilliseconds > 0) {
      _fps = 1000 / frameTime.inMilliseconds;
    }

    // Detect dropped frames (frames taking longer than 16.67ms for 60fps)
    if (frameTime.inMilliseconds > 16) {
      _droppedFrames++;
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return widget.child;
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          widget.child,
          Positioned(
            top: 50,
            right: 10,
            child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'FPS: ${_fps.toStringAsFixed(1)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'monospace',
                  ),
                ),
                Text(
                  'Dropped: $_droppedFrames',
                  style: TextStyle(
                    color: _droppedFrames > 10 ? Colors.red : Colors.white,
                    fontSize: 12,
                    fontFamily: 'monospace',
                  ),
                ),
                Text(
                  'Frames: $_frameCount',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      ),
    );
  }
}
