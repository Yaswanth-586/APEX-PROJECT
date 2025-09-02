import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/profile_repository.dart';
import '../../data/repositories/catalog_repository.dart';
import '../../data/models/user_model.dart';
import '../../data/models/subject_model.dart';
import '../../core/constants/app_constants.dart';

// Shared Preferences Provider
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be initialized in main.dart');
});

// Repository Providers
final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository());
final profileRepositoryProvider = Provider<ProfileRepository>((ref) => ProfileRepository());
final catalogRepositoryProvider = Provider<CatalogRepository>((ref) => CatalogRepository());

// Auth State Provider
final authStateProvider = StateNotifierProvider<AuthNotifier, AsyncValue<UserModel?>>((ref) {
  return AuthNotifier(ref);
});

// Profile State Provider
final profileStateProvider = StateNotifierProvider<ProfileNotifier, AsyncValue<UserModel?>>((ref) {
  return ProfileNotifier(ref);
});

// Settings Providers
final biometricEnabledProvider = StateProvider<bool>((ref) => false);
final languageProvider = StateProvider<String>((ref) => 'English');

// Catalog Providers
final streamsProvider = Provider<List<String>>((ref) {
  final catalogRepo = ref.watch(catalogRepositoryProvider);
  return catalogRepo.getStreams();
});

final semestersProvider = Provider<List<String>>((ref) {
  final catalogRepo = ref.watch(catalogRepositoryProvider);
  return catalogRepo.getSemesters();
});

final subjectsProvider = Provider.family<List<String>, String>((ref, semester) {
  final catalogRepo = ref.watch(catalogRepositoryProvider);
  return catalogRepo.getSemesterSubjects(semester);
});

final subjectModelsProvider = Provider.family<List<SubjectModel>, String>((ref, semester) {
  final catalogRepo = ref.watch(catalogRepositoryProvider);
  return catalogRepo.getSubjectModels(semester);
});

final popularSubjectsProvider = Provider<List<SubjectModel>>((ref) {
  final catalogRepo = ref.watch(catalogRepositoryProvider);
  return catalogRepo.getPopularSubjects();
});

// Auth Notifier
class AuthNotifier extends StateNotifier<AsyncValue<UserModel?>> {
  final Ref _ref;
  
  AuthNotifier(this._ref) : super(const AsyncValue.loading()) {
    _initializeAuth();
  }
  
  Future<void> _initializeAuth() async {
    try {
      final prefs = _ref.read(sharedPreferencesProvider);
      final isLoggedIn = prefs.getBool(AppConstants.isLoggedInKey) ?? false;
      
      if (isLoggedIn) {
        final profileRepo = _ref.read(profileRepositoryProvider);
        final user = await profileRepo.getUserProfile();
        state = AsyncValue.data(user);
      } else {
        state = const AsyncValue.data(null);
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
  
  Future<bool> login(String email, String password) async {
    try {
      state = const AsyncValue.loading();
      final authRepo = _ref.read(authRepositoryProvider);
      final user = await authRepo.login(email, password);
      
      // Save to shared preferences
      final prefs = _ref.read(sharedPreferencesProvider);
      await prefs.setBool(AppConstants.isLoggedInKey, true);
      
      // Save user profile
      final profileRepo = _ref.read(profileRepositoryProvider);
      await profileRepo.saveUserProfile(user);
      
      state = AsyncValue.data(user);
      return true;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return false;
    }
  }
  
  Future<bool> signup(String name, String email, String password) async {
    try {
      final authRepo = _ref.read(authRepositoryProvider);
      final user = await authRepo.signup(name, email, password);
      
      // Save user profile
      final profileRepo = _ref.read(profileRepositoryProvider);
      await profileRepo.saveUserProfile(user);
      
      return true;
    } catch (e) {
      return false;
    }
  }
  
  Future<bool> changePassword(String currentPassword, String newPassword) async {
    try {
      final authRepo = _ref.read(authRepositoryProvider);
      return await authRepo.changePassword(currentPassword, newPassword);
    } catch (e) {
      return false;
    }
  }
  
  Future<void> logout() async {
    try {
      final prefs = _ref.read(sharedPreferencesProvider);
      await prefs.setBool(AppConstants.isLoggedInKey, false);
      
      final profileRepo = _ref.read(profileRepositoryProvider);
      await profileRepo.clearProfileData();
      
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

// Profile Notifier
class ProfileNotifier extends StateNotifier<AsyncValue<UserModel?>> {
  final Ref _ref;
  
  ProfileNotifier(this._ref) : super(const AsyncValue.loading()) {
    _initializeProfile();
  }
  
  Future<void> _initializeProfile() async {
    try {
      final profileRepo = _ref.read(profileRepositoryProvider);
      final user = await profileRepo.getUserProfile();
      state = AsyncValue.data(user);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
  
  Future<bool> updateProfile({
    String? name,
    String? email,
    String? phone,
  }) async {
    try {
      state = const AsyncValue.loading();
      final profileRepo = _ref.read(profileRepositoryProvider);
      final success = await profileRepo.updateUserProfile(
        name: name,
        email: email,
        phone: phone,
      );
      
      if (success) {
        await _initializeProfile();
      }
      
      return success;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return false;
    }
  }
  
  Future<void> refreshProfile() async {
    await _initializeProfile();
  }
}
