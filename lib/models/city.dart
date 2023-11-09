import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class City {
  int? id;
  String name;
  City({
    this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) =>
      City.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'City(id: $id, name: $name)';
}
