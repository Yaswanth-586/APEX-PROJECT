import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/providers/providers.dart';
import '../../../core/widgets/labeled_text_field.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/outline_button.dart';
import '../../../core/utils/validators.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final success = await ref.read(authStateProvider.notifier).login(
        _emailController.text.trim(),
        _passwordController.text,
      );

      if (success && mounted) {
        context.go('/home');
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid email or password'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // App Logo with Enhanced Design
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
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
                          color: const Color(0xFF2563EB).withValues(alpha: 0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.note_alt_rounded,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Enhanced Welcome Text
                Text(
                  'Welcome Back!',
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: theme.colorScheme.onSurface,
                    letterSpacing: -0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 12),
                
                // Enhanced Subtitle
                Text(
                  'Sign in to continue your learning journey',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 56),
                
                // Email Field
                LabeledTextField(
                  label: 'Email',
                  hint: 'Enter your email address',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.validateEmail,
                  textInputAction: TextInputAction.next,
                ),
                
                const SizedBox(height: 24),
                
                // Password Field
                LabeledTextField(
                  label: 'Password',
                  hint: 'Enter your password',
                  controller: _passwordController,
                  obscureText: true,
                  validator: Validators.validatePassword,
                  textInputAction: TextInputAction.done,
                  onEditingComplete: _login,
                ),
                
                const SizedBox(height: 32),
                
                // Login Button
                PrimaryButton(
                  text: 'Sign In',
                  onPressed: _login,
                  isLoading: _isLoading,
                ),
                
                const SizedBox(height: 16),
                
                // Cancel Button
                OutlineButton(
                  text: 'Cancel',
                  onPressed: () => context.go('/'),
                ),
                
                const SizedBox(height: 24),
                
                // Divider
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: theme.colorScheme.outline.withValues(alpha: 0.3),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'OR',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: theme.colorScheme.outline.withValues(alpha: 0.3),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 24),
                
                // Sign Up Button
                OutlineButton(
                  text: 'Create New Account',
                  onPressed: () => context.go('/signup'),
                ),
                
                const SizedBox(height: 32),
                
                // Demo Credentials
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: theme.colorScheme.outline.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Demo Credentials:',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Email: john@example.com\nPassword: password123',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
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
