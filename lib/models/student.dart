// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:acf_cli/models/address.dart';
import 'package:acf_cli/models/course.dart';

class Student {
  int? id;
  String name;
  int age;
  List<String> nameCourses;
  List<Course> courses;
  Address address;
  Student({
    this.id,
    required this.name,
    required this.age,
    required this.nameCourses,
    required this.courses,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'nameCourses': nameCourses,
      'courses': courses.map((x) => x.toMap()).toList(),
      'address': address.toMap(),
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      age: map['age'] as int,
      nameCourses: List<String>.from(
        (map['nameCourses'] as List<String>),
      ),
      courses: List<Course>.from(
        (map['courses'] as List<Map<String, dynamic>>).map<Course>(
          (x) => Course.fromMap(x),
        ),
      ),
      address: Address.fromMap(map['address'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source) as Map<String, dynamic>);
}
