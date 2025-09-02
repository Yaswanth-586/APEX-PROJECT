class AppConstants {
  // App Info
  static const String appName = 'DIGI-NOTES';
  static const String appVersion = '1.0.0';
  
  // Shared Preferences Keys
  static const String isLoggedInKey = 'isLoggedIn';
  static const String userProfileKey = 'userProfile';
  static const String biometricEnabledKey = 'biometricEnabled';
  static const String languageKey = 'language';
  
  // Validation
  static const int minPasswordLength = 8;
  static const String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double cardRadius = 16.0;
  static const double buttonRadius = 12.0;
  static const double inputRadius = 12.0;
  
  // Mock Data
  static const List<String> streams = [
    'Intermediate',
    'B.Tech',
    'Degree',
  ];
  
  static const Map<String, List<String>> streamSubjects = {
    'Intermediate': ['MPC', 'BiPC', 'CEC'],
    'B.Tech': ['CSE', 'ECE', 'EEE'],
    'Degree': ['BSc', 'BBA', 'BCOM'],
  };
  
  static const List<String> semesters = [
    'SEM1', 'SEM2', 'SEM3', 'SEM4',
    'SEM5', 'SEM6', 'SEM7', 'SEM8',
  ];
  
  static const Map<String, List<String>> semesterSubjects = {
    'SEM1': ['C Programming', 'Physics', 'Mathematics', 'English'],
    'SEM2': ['Data Structures', 'Digital Electronics', 'Calculus', 'Communication Skills'],
    'SEM3': ['Object Oriented Programming', 'Computer Networks', 'Database Systems', 'Software Engineering'],
    'SEM4': ['Operating Systems', 'Computer Architecture', 'Web Development', 'Data Science'],
    'SEM5': ['Machine Learning', 'Cloud Computing', 'Cybersecurity', 'Mobile Development'],
    'SEM6': ['Artificial Intelligence', 'Big Data', 'IoT', 'Blockchain'],
    'SEM7': ['Deep Learning', 'DevOps', 'UI/UX Design', 'Project Management'],
    'SEM8': ['Capstone Project', 'Internship', 'Research Paper', 'Industry Training'],
  };
  
  static const List<String> subjectLinks = [
    'Notes',
    'IMP Questions',
    'Previous Papers',
    'Formulas',
  ];
}
