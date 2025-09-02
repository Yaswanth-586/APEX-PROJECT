import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'core/providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    // Initialize SharedPreferences asynchronously
    final sharedPreferences = await SharedPreferences.getInstance();
    
    runApp(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        ],
        child: const DigiNotesApp(),
      ),
    );
  } catch (e) {
    // Fallback initialization if SharedPreferences fails
    runApp(
      const ProviderScope(
        child: DigiNotesApp(),
      ),
    );
  }
}
