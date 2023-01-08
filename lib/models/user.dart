import 'package:sirialization/models/address.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String username;
  final String password;
  final String birthDate;
  final double height;
  final double weight;
  final Address address;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.height,
    required this.weight,
    required this.address,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        maidenName = json['maidenName'],
        age = json['age'],
        gender = json['gender'],
        email = json['email'],
        phone = json['phone'],
        username = json['username'],
        password = json['password'],
        birthDate = json['birthDate'],
        height = json['height'].runtimeType == int ? json['height'].toDouble() : json['height'].toDouble(),
        weight = json['weight'].runtimeType == int ? json['weight'].toDouble() : json['weight'].toDouble(),
        address = Address.fromJson(json['address']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'maidenName': maidenName,
      'age': age,
      'gender': gender,
      'email': email,
      'phone': phone,
      'username': username,
      'password': password,
      'birthDate': birthDate,
      'height': height,
      'weight': weight,
      'address': address,
    };
  }
}
