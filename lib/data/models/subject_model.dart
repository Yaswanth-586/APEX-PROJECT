class SubjectModel {
  final String id;
  final String title;
  final String bannerAsset;
  final Map<String, String> links;

  const SubjectModel({
    required this.id,
    required this.title,
    required this.bannerAsset,
    required this.links,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'] as String,
      title: json['title'] as String,
      bannerAsset: json['bannerAsset'] as String,
      links: Map<String, String>.from(json['links'] as Map),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'bannerAsset': bannerAsset,
      'links': links,
    };
  }

  SubjectModel copyWith({
    String? id,
    String? title,
    String? bannerAsset,
    Map<String, String>? links,
  }) {
    return SubjectModel(
      id: id ?? this.id,
      title: title ?? this.title,
      bannerAsset: bannerAsset ?? this.bannerAsset,
      links: links ?? this.links,
    );
  }

  @override
  String toString() {
    return 'SubjectModel(id: $id, title: $title, bannerAsset: $bannerAsset, links: $links)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SubjectModel &&
        other.id == id &&
        other.title == title &&
        other.bannerAsset == bannerAsset &&
        other.links == links;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        bannerAsset.hashCode ^
        links.hashCode;
  }
}
