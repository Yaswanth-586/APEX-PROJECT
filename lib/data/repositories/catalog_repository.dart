import '../models/subject_model.dart';
import '../../core/constants/app_constants.dart';

class CatalogRepository {
  // Get all streams
  List<String> getStreams() {
    return AppConstants.streams;
  }

  // Get subjects for a specific stream
  List<String> getStreamSubjects(String stream) {
    return AppConstants.streamSubjects[stream] ?? [];
  }

  // Get all semesters
  List<String> getSemesters() {
    return AppConstants.semesters;
  }

  // Get subjects for a specific semester
  List<String> getSemesterSubjects(String semester) {
    return AppConstants.semesterSubjects[semester] ?? [];
  }

  // Get subject links
  List<String> getSubjectLinks() {
    return AppConstants.subjectLinks;
  }

  // Generate mock subject models for a semester
  List<SubjectModel> getSubjectModels(String semester) {
    final subjects = getSemesterSubjects(semester);
    final links = getSubjectLinks();
    
    return subjects.map((subject) {
      // Create mock links for each subject
      final subjectLinks = <String, String>{};
      for (final link in links) {
        subjectLinks[link] = 'https://example.com/${subject.toLowerCase().replaceAll(' ', '-')}/${link.toLowerCase().replaceAll(' ', '-')}';
      }
      
      return SubjectModel(
        id: '${semester}_${subject.replaceAll(' ', '_')}',
        title: subject,
        bannerAsset: 'assets/images/subjects/${subject.toLowerCase().replaceAll(' ', '_')}_banner.jpg',
        links: subjectLinks,
      );
    }).toList();
  }

  // Get stream icon asset path
  String getStreamIcon(String stream) {
    return 'assets/icons/${stream.toLowerCase().replaceAll(' ', '_')}_icon.png';
  }

  // Get semester icon asset path
  String getSemesterIcon(String semester) {
    return 'assets/icons/${semester.toLowerCase()}_icon.png';
  }

  // Search subjects by query
  List<SubjectModel> searchSubjects(String query, String semester) {
    final allSubjects = getSubjectModels(semester);
    if (query.isEmpty) return allSubjects;
    
    return allSubjects.where((subject) {
      return subject.title.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  // Get popular subjects (mock data)
  List<SubjectModel> getPopularSubjects() {
    return [
      const SubjectModel(
        id: 'popular_1',
        title: 'C Programming',
        bannerAsset: 'assets/images/subjects/c_programming_banner.jpg',
        links: {
          'Notes': 'https://example.com/c-programming/notes',
          'IMP Questions': 'https://example.com/c-programming/imp-questions',
          'Previous Papers': 'https://example.com/c-programming/previous-papers',
          'Formulas': 'https://example.com/c-programming/formulas',
        },
      ),
      const SubjectModel(
        id: 'popular_2',
        title: 'Data Structures',
        bannerAsset: 'assets/images/subjects/data_structures_banner.jpg',
        links: {
          'Notes': 'https://example.com/data-structures/notes',
          'IMP Questions': 'https://example.com/data-structures/imp-questions',
          'Previous Papers': 'https://example.com/data-structures/previous-papers',
          'Formulas': 'https://example.com/data-structures/formulas',
        },
      ),
      const SubjectModel(
        id: 'popular_3',
        title: 'Mathematics',
        bannerAsset: 'assets/images/subjects/mathematics_banner.jpg',
        links: {
          'Notes': 'https://example.com/mathematics/notes',
          'IMP Questions': 'https://example.com/mathematics/imp-questions',
          'Previous Papers': 'https://example.com/mathematics/previous-papers',
          'Formulas': 'https://example.com/mathematics/formulas',
        },
      ),
    ];
  }
}
