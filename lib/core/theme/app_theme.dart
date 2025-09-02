import 'package:flutter/material.dart';

class AppTheme {
  // Professional Color Palette
  static const Color primaryColor = Color(0xFF2563EB); // Modern Blue
  static const Color primaryVariant = Color(0xFF1D4ED8); // Darker Blue
  static const Color secondaryColor = Color(0xFF7C3AED); // Purple
  static const Color secondaryVariant = Color(0xFF6D28D9); // Darker Purple
  
  // Surface Colors
  static const Color surfaceColor = Color(0xFFFFFFFF); // Pure White
  static const Color surfaceVariant = Color(0xFFF8FAFC); // Light Gray
  static const Color backgroundColor = Color(0xFFF1F5F9); // Very Light Blue Gray
  
  // Accent Colors
  static const Color accentColor = Color(0xFF10B981); // Emerald Green
  static const Color warningColor = Color(0xFFF59E0B); // Amber
  static const Color errorColor = Color(0xFFEF4444); // Red
  static const Color successColor = Color(0xFF10B981); // Green
  
  // Text Colors
  static const Color textPrimary = Color(0xFF0F172A); // Dark Blue Gray
  static const Color textSecondary = Color(0xFF475569); // Medium Blue Gray
  static const Color textTertiary = Color(0xFF94A3B8); // Light Blue Gray
  
  // Card & Border Colors
  static const Color cardColor = Color(0xFFFFFFFF);
  static const Color cardBorderColor = Color(0xFFE2E8F0);
  static const Color dividerColor = Color(0xFFE2E8F0);
  
  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF2563EB), Color(0xFF1D4ED8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [Color(0xFF7C3AED), Color(0xFF6D28D9)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFF10B981), Color(0xFF059669)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Enhanced Text Styles with Professional Typography
  static TextTheme get textTheme {
    return const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        color: textPrimary,
        letterSpacing: -0.5,
        height: 1.2,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: textPrimary,
        letterSpacing: -0.3,
        height: 1.3,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: textPrimary,
        letterSpacing: -0.2,
        height: 1.3,
      ),
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: textPrimary,
        letterSpacing: -0.1,
        height: 1.4,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: -0.1,
        height: 1.4,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: 0,
        height: 1.4,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: 0,
        height: 1.5,
      ),
      titleMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textPrimary,
        letterSpacing: 0.1,
        height: 1.5,
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: textSecondary,
        letterSpacing: 0.1,
        height: 1.5,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textPrimary,
        letterSpacing: 0.1,
        height: 1.6,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textPrimary,
        letterSpacing: 0.1,
        height: 1.6,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textSecondary,
        letterSpacing: 0.1,
        height: 1.6,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textPrimary,
        letterSpacing: 0.1,
        height: 1.4,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: textSecondary,
        letterSpacing: 0.1,
        height: 1.4,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: textTertiary,
        letterSpacing: 0.1,
        height: 1.4,
      ),
    );
  }

  // Professional Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        primary: primaryColor,
        secondary: secondaryColor,
        surface: surfaceColor,
        surfaceContainerHighest: surfaceVariant,
        surfaceContainer: backgroundColor, // Changed from background
        error: errorColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textPrimary,
      ),
      textTheme: textTheme,
      fontFamily: 'Inter', // Modern, professional font
      scaffoldBackgroundColor: backgroundColor,
      
      // Enhanced AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: textTheme.headlineMedium?.copyWith(
          color: textPrimary,
          fontWeight: FontWeight.w700,
        ),
        iconTheme: const IconThemeData(
          color: textPrimary,
          size: 24,
        ),
        actionsIconTheme: const IconThemeData(
          color: textPrimary,
          size: 24,
        ),
      ),
      
      // Professional Card Theme
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: cardBorderColor,
            width: 1,
          ),
        ),
        color: cardColor,
        shadowColor: Colors.black.withValues(alpha: 0.08),
        margin: const EdgeInsets.all(8),
      ),
      
      // Enhanced Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: primaryColor.withValues(alpha: 0.3),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      
      // Professional Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: const BorderSide(color: primaryColor, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      
      // Enhanced Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: errorColor, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: errorColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        labelStyle: textTheme.bodyMedium?.copyWith(
          color: textSecondary,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: textTertiary,
          fontWeight: FontWeight.w400,
        ),
        floatingLabelStyle: textTheme.bodyMedium?.copyWith(
          color: primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      
      // Enhanced Bottom Navigation Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: cardColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: textTertiary,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: textTheme.labelSmall,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
      
      // Enhanced Floating Action Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      
      // Enhanced Divider Theme
      dividerTheme: const DividerThemeData(
        color: dividerColor,
        thickness: 1,
        space: 1,
      ),
      
      // Enhanced Icon Theme
      iconTheme: const IconThemeData(
        color: Color(0xFFD1D5DB), // Light gray equivalent to shade300
        size: 24,
      ),
      
      // Enhanced Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: surfaceVariant,
        selectedColor: primaryColor.withValues(alpha: 0.1),
        disabledColor: textTertiary.withValues(alpha: 0.1),
        labelStyle: textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: const BorderSide(color: cardBorderColor),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }

  // Professional Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
        primary: primaryColor,
        secondary: secondaryColor,
        surface: const Color(0xFF1E293B), // Dark Blue Gray
        surfaceContainerHighest: const Color(0xFF0F172A), // Darker Blue Gray
        surfaceContainer: const Color(0xFF0F172A), // Darkest Blue Gray
        error: errorColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
      ),
      textTheme: textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      fontFamily: 'Inter',
      scaffoldBackgroundColor: const Color(0xFF0F172A),
      
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: textTheme.headlineMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 24,
        ),
        actionsIconTheme: const IconThemeData(
          color: Colors.white,
          size: 24,
        ),
      ),
      
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: Color(0xFF334155),
            width: 1,
          ),
        ),
        color: const Color(0xFF1E293B),
        shadowColor: Colors.black.withValues(alpha: 0.3),
        margin: const EdgeInsets.all(8),
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: primaryColor.withValues(alpha: 0.3),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: const BorderSide(color: primaryColor, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF334155),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: errorColor, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: errorColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        labelStyle: textTheme.bodyMedium?.copyWith(
          color: const Color(0xFFD1D5DB), // Light gray equivalent to shade300
          fontWeight: FontWeight.w500,
        ),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: const Color(0xFF9CA3AF), // Medium gray equivalent to shade400
          fontWeight: FontWeight.w400,
        ),
        floatingLabelStyle: textTheme.bodyMedium?.copyWith(
          color: primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: const Color(0xFF1E293B),
        selectedItemColor: primaryColor,
        unselectedItemColor: const Color(0xFF9CA3AF), // Medium gray equivalent to shade400
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: textTheme.labelSmall,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
      
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      
      dividerTheme: const DividerThemeData(
        color: Color(0xFF334155),
        thickness: 1,
        space: 1,
      ),
      
      iconTheme: IconThemeData(
        color: Colors.grey.shade300,
        size: 24,
      ),
      
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFF334155),
        selectedColor: primaryColor.withValues(alpha: 0.2),
        disabledColor: const Color(0xFF4B5563).withValues(alpha: 0.1), // Dark gray equivalent to shade600
        labelStyle: textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: const BorderSide(color: Color(0xFF334155)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}
