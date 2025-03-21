// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final String phone;
  final String pfp;
  final String role;

  const User({
    required this.id,
    required this.firstname,
    required this.email,
    required this.lastname,
    required this.pfp,
    required this.phone,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'phone': phone,
      'pfp': pfp,
      'role': role,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      pfp: map['pfp'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
