import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  const AppUser ({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.createdAt,
  });
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final DateTime createdAt;

  factory AppUser.fromMap(String uid, Map<String, dynamic> data) {
    return AppUser(
      uid: uid,
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      email: data['email'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}