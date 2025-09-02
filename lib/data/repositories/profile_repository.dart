import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../../core/constants/app_constants.dart';

class ProfileRepository {
  static const String _userProfileKey = AppConstants.userProfileKey;
  static const String _biometricEnabledKey = AppConstants.biometricEnabledKey;
  static const String _languageKey = AppConstants.languageKey;

  // Get user profile
  Future<UserModel?> getUserProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString(_userProfileKey);
      
      if (userJson != null) {
        return UserModel.fromJson(jsonDecode(userJson));
      }
      
      return null;
    } catch (e) {
      return null;
    }
  }

  // Save user profile
  Future<bool> saveUserProfile(UserModel user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = jsonEncode(user.toJson());
      return await prefs.setString(_userProfileKey, userJson);
    } catch (e) {
      return false;
    }
  }

  // Update user profile
  Future<bool> updateUserProfile({
    String? name,
    String? email,
    String? phone,
  }) async {
    try {
      final currentUser = await getUserProfile();
      if (currentUser == null) return false;
      
      final updatedUser = currentUser.copyWith(
        name: name ?? currentUser.name,
        email: email ?? currentUser.email,
        phone: phone ?? currentUser.phone,
      );
      
      return await saveUserProfile(updatedUser);
    } catch (e) {
      return false;
    }
  }

  // Get biometric setting
  Future<bool> getBiometricEnabled() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_biometricEnabledKey) ?? false;
    } catch (e) {
      return false;
    }
  }

  // Set biometric setting
  Future<bool> setBiometricEnabled(bool enabled) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.setBool(_biometricEnabledKey, enabled);
    } catch (e) {
      return false;
    }
  }

  // Get language setting
  Future<String> getLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_languageKey) ?? 'English';
    } catch (e) {
      return 'English';
    }
  }

  // Set language setting
  Future<bool> setLanguage(String language) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.setString(_languageKey, language);
    } catch (e) {
      return false;
    }
  }

  // Clear all profile data
  Future<bool> clearProfileData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_userProfileKey);
      await prefs.remove(_biometricEnabledKey);
      await prefs.remove(_languageKey);
      return true;
    } catch (e) {
      return false;
    }
  }
}
