import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String username;
  final String email;
  final String? profileImageUrl;
  final DateTime createdAt;
  final bool? darkMode;
  final bool? isVerified;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.profileImageUrl,
    required this.createdAt,
    this.darkMode,
    this.isVerified,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      username: data['username'] as String,
      email: data['email'] as String,
      profileImageUrl: data['profileImageUrl'] as String?,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      darkMode: data['preferences']?['darkMode'] as bool?,
      isVerified: data['isVerified'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'username': username,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'createdAt': Timestamp.fromDate(createdAt),
      'preferences': {
        'darkMode': darkMode ?? false,
      },
      'isVerified': isVerified ?? false,
    };
  }

  UserModel copyWith({
    String? username,
    String? email,
    String? profileImageUrl,
    bool? darkMode,
    bool? isVerified,
  }) {
    return UserModel(
      id: id,
      username: username ?? this.username,
      email: email ?? this.email,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      createdAt: createdAt,
      darkMode: darkMode ?? this.darkMode,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}

