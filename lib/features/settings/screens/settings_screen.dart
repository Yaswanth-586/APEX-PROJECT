import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/providers/providers.dart';
import '../../../core/widgets/section_header.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final user = ref.watch(authStateProvider).value;
    final biometricEnabled = ref.watch(biometricEnabledProvider);
    final language = ref.watch(languageProvider);
    
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section with Enhanced Design
            if (user != null) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF2563EB),
                      Color(0xFF7C3AED),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2563EB).withValues(alpha: 0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.3),
                          width: 2,
                        ),
                      ),
                      child: Text(
                        user.name.isNotEmpty ? user.name[0].toUpperCase() : 'U',
                        style: theme.textTheme.displaySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: -0.2,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            user.email,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: Colors.white.withValues(alpha: 0.9),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () => context.go('/edit-profile'),
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
            
            // Account Settings
            const SectionHeader(
              title: 'Account Settings',
              padding: EdgeInsets.zero,
            ),
            const SizedBox(height: 16),
            
            _buildSettingsTile(
              context,
              'Edit Profile',
              Icons.person_outline,
              () => context.go('/edit-profile'),
            ),
            
            _buildSettingsTile(
              context,
              'Change Password',
              Icons.lock_outline,
              () => context.go('/change-password'),
            ),
            
            _buildSettingsTile(
              context,
              'Language',
              Icons.language,
              () => _showLanguageDialog(context, language),
              trailing: Text(
                language,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // App Settings
            const SectionHeader(
              title: 'App Settings',
              padding: EdgeInsets.zero,
            ),
            const SizedBox(height: 16),
            
            _buildSwitchTile(
              context,
              'Biometric Authentication',
              Icons.fingerprint,
              biometricEnabled,
              (value) {
                ref.read(biometricEnabledProvider.notifier).state = value;
                // TODO: Implement actual biometric authentication
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      value ? 'Biometric authentication enabled' : 'Biometric authentication disabled',
                    ),
                  ),
                );
              },
            ),
            
            _buildSettingsTile(
              context,
              'Notifications',
              Icons.notifications_outlined,
              () {
                // TODO: Implement notifications settings
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Notifications settings coming soon!'),
                  ),
                );
              },
            ),
            
            const SizedBox(height: 32),
            
            // Support & Info
            const SectionHeader(
              title: 'Support & Information',
              padding: EdgeInsets.zero,
            ),
            const SizedBox(height: 16),
            
            _buildSettingsTile(
              context,
              'Contact Us',
              Icons.email_outlined,
              () => _launchEmail(),
            ),
            
            _buildSettingsTile(
              context,
              'Privacy Policy',
              Icons.privacy_tip_outlined,
              () => _launchPrivacyPolicy(),
            ),
            
            _buildSettingsTile(
              context,
              'Terms of Service',
              Icons.description_outlined,
              () => _launchTermsOfService(),
            ),
            
            _buildSettingsTile(
              context,
              'About App',
              Icons.info_outline,
              () => _showAboutDialog(context),
            ),
            
            const SizedBox(height: 32),
            
            // App Version
            Center(
              child: Text(
                'Version 1.0.0',
                style: theme.textTheme.bodySmall?.copyWith(
                                      color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Logout Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => _showLogoutDialog(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap, {
    Widget? trailing,
  }) {
    final theme = Theme.of(context);
    
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(
          icon,
          color: theme.colorScheme.primary,
        ),
        title: Text(title),
        trailing: trailing ?? const Icon(Icons.arrow_forward_ios_rounded),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSwitchTile(
    BuildContext context,
    String title,
    IconData icon,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    final theme = Theme.of(context);
    
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(
          icon,
          color: theme.colorScheme.primary,
        ),
        title: Text(title),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: theme.colorScheme.primary,
        ),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context, String currentLanguage) {
    final languages = ['English', 'Spanish', 'French', 'German', 'Hindi'];
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Language'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: languages.length,
            itemBuilder: (context, index) {
              final language = languages[index];
              return ListTile(
                title: Text(language),
                trailing: language == currentLanguage
                    ? Icon(
                        Icons.check,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : null,
                onTap: () {
                  ref.read(languageProvider.notifier).state = language;
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Language changed to $language'),
                    ),
                  );
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About DIGI-NOTES'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('A comprehensive digital learning platform for students.'),
            SizedBox(height: 16),
            Text('Features:'),
            Text('• Study materials and notes'),
            Text('• Important questions'),
            Text('• Previous year papers'),
            Text('• Formulas and quick references'),
            SizedBox(height: 16),
            Text('Version: 1.0.0'),
            Text('© 2024 DIGI-NOTES'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(authStateProvider.notifier).logout();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  Future<void> _launchEmail() async {
    try {
      final uri = Uri.parse('mailto:support@digi-notes.com?subject=Support Request');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> _launchPrivacyPolicy() async {
    try {
      final uri = Uri.parse('https://example.com/privacy-policy');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      // Handle error silently
    }
  }

  Future<void> _launchTermsOfService() async {
    try {
      final uri = Uri.parse('https://example.com/terms-of-service');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      // Handle error silently
    }
  }
}
