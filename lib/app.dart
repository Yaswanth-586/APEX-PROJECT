import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'routes.dart';

class DigiNotesApp extends StatelessWidget {
  const DigiNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DIGI-NOTES',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}
