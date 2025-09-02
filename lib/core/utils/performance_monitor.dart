import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

class PerformanceMonitor {
  static void logPerformance(String operation, Duration duration) {
    if (kDebugMode) {
      developer.log(
        'Performance: $operation took ${duration.inMilliseconds}ms',
        name: 'PerformanceMonitor',
      );
    }
  }

  static void logFrameDrop(int droppedFrames) {
    if (kDebugMode && droppedFrames > 0) {
      developer.log(
        'Frame drops detected: $droppedFrames frames',
        name: 'PerformanceMonitor',
        level: 800, // Warning level
      );
    }
  }

  static void logMemoryUsage() {
    if (kDebugMode) {
      // This is a placeholder for memory monitoring
      // In a real app, you might use packages like `memory_info` or `device_info_plus`
      developer.log(
        'Memory usage check',
        name: 'PerformanceMonitor',
      );
    }
  }

  static void logWidgetBuild(String widgetName) {
    if (kDebugMode) {
      developer.log(
        'Widget built: $widgetName',
        name: 'PerformanceMonitor',
      );
    }
  }

  static void logProviderUpdate(String providerName) {
    if (kDebugMode) {
      developer.log(
        'Provider updated: $providerName',
        name: 'PerformanceMonitor',
      );
    }
  }
}

class PerformanceTracker {
  final String operation;
  final DateTime startTime;

  PerformanceTracker(this.operation) : startTime = DateTime.now();

  void finish() {
    final duration = DateTime.now().difference(startTime);
    PerformanceMonitor.logPerformance(operation, duration);
  }
}

// Extension for easy performance tracking
extension PerformanceTracking<T> on Future<T> {
  Future<T> trackPerformance(String operation) async {
    final tracker = PerformanceTracker(operation);
    try {
      final result = await this;
      tracker.finish();
      return result;
    } catch (e) {
      tracker.finish();
      rethrow;
    }
  }
}
