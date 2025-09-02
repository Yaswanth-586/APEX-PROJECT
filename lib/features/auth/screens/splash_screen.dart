import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        // Navigate to login page after 5 seconds
        context.go('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2563EB), // Primary Blue
              Color(0xFF1D4ED8), // Darker Blue
              Color(0xFF7C3AED), // Purple
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Enhanced App Logo with Shadow
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.note_alt_rounded,
                    size: 50,
                    color: Color(0xFF2563EB),
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // App Name with Enhanced Typography
                Text(
                  AppConstants.appName,
                  style: theme.textTheme.displayMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 12),
                
                // Enhanced Tagline
                Text(
                  'Your Digital Study Companion',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                ),
                
                const SizedBox(height: 60),
                
                // Enhanced Loading Indicator
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                      backgroundColor: Colors.white.withValues(alpha: 0.2),
                    ),
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // Enhanced Loading Text
                Text(
                  'Loading...',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Version Info
                Text(
                  'Version ${AppConstants.appVersion}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.white.withValues(alpha: 0.6),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
