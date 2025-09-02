import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/providers/providers.dart';
import 'features/auth/screens/splash_screen.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/auth/screens/signup_screen.dart';
import 'features/home/screens/home_screen.dart';
import 'features/years/screens/year_screen.dart';
import 'features/subjects/screens/subjects_screen.dart';
import 'features/settings/screens/settings_screen.dart';
import 'features/profile/screens/edit_profile_screen.dart';
import 'features/auth/screens/change_password_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    // Check if user is logged in
    final container = ProviderScope.containerOf(context);
    final authState = container.read(authStateProvider);
    
    // If still loading, stay on current route (splash screen will handle navigation)
    if (authState.isLoading) return null;
    
    // If error, go to login
    if (authState.hasError) return '/login';
    
    // If not logged in and not on auth screens, redirect to login
    final isLoggedIn = authState.value != null;
    final isAuthScreen = state.matchedLocation == '/login' || 
                        state.matchedLocation == '/signup' ||
                        state.matchedLocation == '/';
    
    if (!isLoggedIn && !isAuthScreen) {
      return '/login';
    }
    
    // If logged in and on auth screens, redirect to home
    if (isLoggedIn && isAuthScreen) {
      return '/home';
    }
    
    return null;
  },
  routes: [
    // Splash Screen
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    
    // Auth Routes
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => const SignupScreen(),
    ),
    
    // Main App Routes
    ShellRoute(
      builder: (context, state, child) => child,
      routes: [
        // Home Screen
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => const HomeScreen(),
        ),
        
        // Year Screen
        GoRoute(
          path: '/years/:stream',
          name: 'years',
          builder: (context, state) {
            final stream = state.pathParameters['stream']!;
            return YearScreen(stream: stream);
          },
        ),
        
        // Subjects Screen
        GoRoute(
          path: '/subjects/:stream/:sem',
          name: 'subjects',
          builder: (context, state) {
            final stream = state.pathParameters['stream']!;
            final sem = state.pathParameters['sem']!;
            return SubjectsScreen(stream: stream, semester: sem);
          },
        ),
        
        // Settings Screen
        GoRoute(
          path: '/settings',
          name: 'settings',
          builder: (context, state) => const SettingsScreen(),
        ),
        
        // Edit Profile Screen
        GoRoute(
          path: '/edit-profile',
          name: 'edit-profile',
          builder: (context, state) => const EditProfileScreen(),
        ),
        
        // Change Password Screen
        GoRoute(
          path: '/change-password',
          name: 'change-password',
          builder: (context, state) => const ChangePasswordScreen(),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          Text(
            'Page not found',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'The page you are looking for does not exist.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => context.go('/'),
            child: const Text('Go Home'),
          ),
        ],
      ),
    ),
  ),
);
