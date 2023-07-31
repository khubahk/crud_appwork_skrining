import 'dart:convert';

class User {
  int id;
  String firstName;
  String lastName;
  String weight;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.weight});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'weight': weight
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['id'] as int,
        firstName: map['firstName'] as String,
        lastName: map['lastName'] as String,
        weight: map['weight'] as String);
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
