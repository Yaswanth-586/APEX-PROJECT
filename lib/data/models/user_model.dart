class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final DateTime? joinedAt;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.joinedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      joinedAt: json['joinedAt'] != null ? DateTime.parse(json['joinedAt'] as String) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'joinedAt': joinedAt?.toIso8601String(),
    };
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    DateTime? joinedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, phone: $phone, joinedAt: $joinedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.joinedAt == joinedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        joinedAt.hashCode;
  }
}
