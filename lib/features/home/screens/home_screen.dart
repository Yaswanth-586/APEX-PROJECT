import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/providers/providers.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/constants/app_constants.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final streams = ref.watch(streamsProvider);
    final authState = ref.watch(authStateProvider);
    final user = authState.value;
    
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: const Text('DIGI-NOTES'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Implement search functionality
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () async {
              final router = GoRouter.of(context);
              await ref.read(authStateProvider.notifier).logout();
              if (mounted) {
                router.go('/login');
              }
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: authState.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : authState.hasError
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 64,
                        color: theme.colorScheme.error,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Something went wrong',
                        style: theme.textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Please try again later',
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          ref.invalidate(authStateProvider);
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            // Welcome Section
            if (user != null) ...[
              Text(
                'Welcome back, ${user.name}!',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Choose your stream to get started',
                style: theme.textTheme.bodyLarge?.copyWith(
                                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              const SizedBox(height: 32),
            ],
            
            // Streams Section
            const SectionHeader(
              title: 'Available Streams',
              padding: EdgeInsets.zero,
            ),
            const SizedBox(height: 16),
            
            // Stream Cards Grid - Simplified
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.85, // Adjusted to prevent overflow
              ),
              itemCount: streams.length,
              itemBuilder: (context, index) {
                final stream = streams[index];
                final subjects = AppConstants.streamSubjects[stream] ?? [];
                
                return _buildStreamCard(context, stream, subjects);
              },
            ),
            
            const SizedBox(height: 32),
            
            // Quick Actions Section
            const SectionHeader(
              title: 'Quick Actions',
              padding: EdgeInsets.zero,
            ),
            const SizedBox(height: 16),
            
            Row(
              children: [
                Expanded(
                  child: _buildQuickActionCard(
                    context,
                    'Recent Subjects',
                    Icons.history,
                    theme.colorScheme.primary,
                    () {
                      // TODO: Navigate to recent subjects
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildQuickActionCard(
                    context,
                    'Favorites',
                    Icons.favorite,
                    Colors.red,
                    () {
                      // TODO: Navigate to favorites
                    },
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Popular Subjects Section
            const SectionHeader(
              title: 'Popular Subjects',
              padding: EdgeInsets.zero,
            ),
            const SizedBox(height: 16),
            
            // Simplified horizontal list
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  final subjects = ['C Programming', 'Data Structures', 'Mathematics'];
                  return Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 12),
                    child: Card(
                      child: InkWell(
                        onTap: () {
                          // TODO: Navigate to subject details
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.book,
                                color: theme.colorScheme.primary,
                                size: 20,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                subjects[index],
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
                    ],
                  ),
                ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          
          switch (index) {
            case 0:
              // Already on home
              break;
            case 1:
              // TODO: Navigate to mock tests
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Mock Tests coming soon!'),
                ),
              );
              break;
            case 2:
              context.go('/settings');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Mock Tests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildStreamCard(BuildContext context, String stream, List<String> subjects) {
    final theme = Theme.of(context);
    
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Color(0xFFE2E8F0),
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () => context.go('/years/$stream'),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(16), // Reduced from 20 to 16
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.colorScheme.surface,
                theme.colorScheme.surfaceContainerHighest,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stream Icon with Enhanced Design
              Container(
                width: 48, // Reduced from 56 to 48
                height: 48, // Reduced from 56 to 48
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF2563EB),
                      Color(0xFF7C3AED),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(14), // Reduced from 16 to 14
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2563EB).withValues(alpha: 0.3),
                      blurRadius: 10, // Reduced from 12 to 10
                      offset: const Offset(0, 5), // Reduced from 6 to 5
                    ),
                  ],
                ),
                child: Icon(
                  _getStreamIcon(stream),
                  color: Colors.white,
                  size: 24, // Reduced from 28 to 24
                ),
              ),
              
              const SizedBox(height: 16), // Reduced from 20 to 16
              
              // Stream Name with Enhanced Typography
              Text(
                stream,
                style: theme.textTheme.titleMedium?.copyWith( // Changed from titleLarge to titleMedium
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface,
                  letterSpacing: -0.2,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              
              const SizedBox(height: 6), // Reduced from 8 to 6
              
              // Subject Count with Enhanced Styling
              Text(
                '${subjects.length} subjects',
                style: theme.textTheme.bodySmall?.copyWith( // Changed from bodyMedium to bodySmall
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
              
              const Spacer(),
              
              // Enhanced Arrow Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6), // Reduced from 8 to 6
                    decoration: BoxDecoration(
                      color: const Color(0xFF2563EB).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10), // Reduced from 12 to 10
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xFF2563EB),
                      size: 14, // Reduced from 16 to 14
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    final theme = Theme.of(context);
    
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: color,
                size: 20,
              ),
              const SizedBox(height: 6),
              Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getStreamIcon(String stream) {
    switch (stream) {
      case 'Intermediate':
        return Icons.school;
      case 'B.Tech':
        return Icons.engineering;
      case 'Degree':
        return Icons.school;
      default:
        return Icons.book;
    }
  }
}
