import 'package:isar/isar.dart';

import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required Id id,
    required String uuidId,
    required String name,
    required String email,
    String? cellphone,
    DateTime? birthday,
    String? gender,
    String? urlPhotoProfile,
    required String userProfile,
    required String masterLanguage,
    String? guardianIntegration,
    DateTime? lastLogin,
    required String status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
    id: id,
    uuidId: uuidId,
    name: name,
    email: email,
    cellphone: cellphone,
    birthday: birthday,
    gender: gender,
    urlPhotoProfile: urlPhotoProfile,
    userProfile: userProfile,
    masterLanguage: masterLanguage,
    guardianIntegration: guardianIntegration,
    lastLogin: lastLogin,
    status: status,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    print("user_model => $json");
    return UserModel(
      id: json['id'],
      uuidId: json['uuidId'],
      name: json['name'],
      email: json['email'],
      cellphone: json['cellphone'],
      birthday: json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
      gender: json['gender'],
      urlPhotoProfile: json['urlPhotoProfile'],
      userProfile: json['userProfile'],
      masterLanguage: json['masterLanguage'],
      guardianIntegration: json['guardianIntegration'] ?? '',
      lastLogin: json['lastLogin'] != null ? DateTime.parse(json['lastLogin']) : null,
      status: json['status'] ?? 'A',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuidId': uuidId,
      'name': name,
      'email': email,
      'cellphone': cellphone,
      'birthday': birthday?.toIso8601String(),
      'gender': gender,
      'urlPhotoProfile': urlPhotoProfile,
      'userProfile': userProfile,
      'masterLanguage': masterLanguage,
      'guardianIntegration': guardianIntegration,
      'lastLogin': lastLogin?.toIso8601String(),
      'status': status,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
