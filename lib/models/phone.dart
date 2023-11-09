import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Phone {
  int ddd;
  String phone;
  Phone({
    required this.ddd,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ddd': ddd,
      'phone': phone,
    };
  }

  factory Phone.fromMap(Map<String, dynamic> map) {
    return Phone(
      ddd: map['ddd'] as int,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Phone.fromJson(String source) =>
      Phone.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Phone(ddd: $ddd, phone: $phone)';
}
