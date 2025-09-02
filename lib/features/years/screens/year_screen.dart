import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/providers/providers.dart';
import '../../../core/widgets/section_header.dart';

class YearScreen extends ConsumerWidget {
  final String stream;

  const YearScreen({
    super.key,
    required this.stream,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final semesters = ref.watch(semestersProvider);
    
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text(stream),
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
            // Stream Info with Enhanced Design
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
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      _getStreamIcon(stream),
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    stream,
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Select a semester to explore subjects',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Semesters Section
            const SectionHeader(
              title: 'Available Semesters',
              padding: EdgeInsets.zero,
            ),
            const SizedBox(height: 16),
            
            // Semesters Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75, // Adjusted to prevent overflow
              ),
              itemCount: semesters.length,
              itemBuilder: (context, index) {
                final semester = semesters[index];
                return _buildSemesterCard(context, semester);
              },
            ),
            
            const SizedBox(height: 32),
            
            // Additional Info
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
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: theme.colorScheme.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'About $stream',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _getStreamDescription(stream),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSemesterCard(BuildContext context, String semester) {
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
        onTap: () => context.go('/subjects/$stream/$semester'),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Semester Icon with Enhanced Design
              Container(
                width: 50, // Reduced from 60 to 50
                height: 50, // Reduced from 60 to 50
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF2563EB),
                      Color(0xFF7C3AED),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16), // Reduced from 18 to 16
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2563EB).withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.school,
                  color: Colors.white,
                  size: 24, // Reduced from 28 to 24
                ),
              ),
              
              const SizedBox(height: 16), // Reduced from 20 to 16
              
              // Semester Name with Enhanced Typography
              Text(
                semester,
                style: theme.textTheme.titleMedium?.copyWith( // Changed from titleLarge to titleMedium
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface,
                  letterSpacing: -0.2,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              
              const SizedBox(height: 6), // Reduced from 8 to 6
              
              // Subject Count with Enhanced Styling
              Text(
                '${_getSubjectCount(semester)} subjects',
                style: theme.textTheme.bodySmall?.copyWith( // Changed from bodyMedium to bodySmall
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              
              const SizedBox(height: 12), // Reduced from 16 to 12
              
              // Enhanced Arrow Icon
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

  String _getStreamDescription(String stream) {
    switch (stream) {
      case 'Intermediate':
        return 'Intermediate education provides foundational knowledge in various streams like MPC (Mathematics, Physics, Chemistry), BiPC (Biology, Physics, Chemistry), and CEC (Commerce, Economics, Civics).';
      case 'B.Tech':
        return 'Bachelor of Technology is a 4-year undergraduate engineering program offering specializations in Computer Science, Electronics, Electrical, and other engineering disciplines.';
      case 'Degree':
        return 'Degree programs include Bachelor of Science (BSc), Bachelor of Business Administration (BBA), and Bachelor of Commerce (BCOM) with various specializations.';
      default:
        return 'Explore subjects and study materials for your chosen stream.';
    }
  }

  int _getSubjectCount(String semester) {
    // Mock subject counts for each semester
    switch (semester) {
      case 'SEM1':
      case 'SEM2':
        return 4;
      case 'SEM3':
      case 'SEM4':
        return 4;
      case 'SEM5':
      case 'SEM6':
        return 4;
      case 'SEM7':
      case 'SEM8':
        return 4;
      default:
        return 4;
    }
  }
}
