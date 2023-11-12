import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Course {
  int? id;
  String name;
  bool? isStudent;
  Course({
    this.id,
    required this.name,
    required this.isStudent,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'isStudent': isStudent,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      isStudent: map['isStudent'] != null ? map['isStudent'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) =>
      Course.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Course(id: $id, name: $name, isStudent: $isStudent)';
}
