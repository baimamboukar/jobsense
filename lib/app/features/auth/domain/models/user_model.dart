// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String userId;
  final String email;
  final String displayName;
  final String photoUrl;
  final String bio;
  final List<String> connections; // List of user IDs representing connections
  // Add more fields as needed

  UserModel({
    required this.userId,
    required this.email,
    required this.displayName,
    required this.photoUrl,
    required this.bio,
    required this.connections,
    // Add more fields as needed
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'bio': bio,
      'connections': connections,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      email: map['email'] as String,
      displayName: map['displayName'] as String,
      photoUrl: map['photoUrl'] as String,
      bio: map['bio'] as String,
      connections: List<String>.from(map['connections'] as List<String>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
