import 'dart:async';
import '../models/user_model.dart';

class AuthRepository {
  // Mock user data
  static const UserModel _mockUser = UserModel(
    id: '1',
    name: 'John Doe',
    email: 'john@example.com',
    phone: '+1234567890',
    joinedAt: null,
  );

  // Mock login
  Future<UserModel> login(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Mock validation
    if (email == 'john@example.com' && password == 'password123') {
      return _mockUser;
    } else if (email == 'test@example.com' && password == 'password123') {
      return _mockUser.copyWith(
        email: email,
        name: 'Test User',
      );
    }
    
    throw Exception('Invalid email or password');
  }

  // Mock signup
  Future<UserModel> signup(String name, String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Mock validation
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      throw Exception('All fields are required');
    }
    
    if (password.length < 8) {
      throw Exception('Password must be at least 8 characters');
    }
    
    // Check if email already exists (mock)
    if (email == 'john@example.com') {
      throw Exception('Email already exists');
    }
    
    return UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      phone: '',
      joinedAt: DateTime.now(),
    );
  }

  // Mock change password
  Future<bool> changePassword(String currentPassword, String newPassword) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Mock validation
    if (currentPassword.isEmpty || newPassword.isEmpty) {
      throw Exception('All fields are required');
    }
    
    if (newPassword.length < 8) {
      throw Exception('New password must be at least 8 characters');
    }
    
    if (currentPassword == newPassword) {
      throw Exception('New password must be different from current password');
    }
    
    return true;
  }

  // Mock logout
  Future<void> logout() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
