import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    int? id,
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
    return UserModel(
      id: json['id'],
      uuidId: json['uuid_id'],
      name: json['name'],
      email: json['email'],
      cellphone: json['cellphone'],
      birthday: json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
      gender: json['gender'],
      urlPhotoProfile: json['url_photo_profile'],
      userProfile: json['user_profile'],
      masterLanguage: json['master_language'],
      guardianIntegration: json['guardian_integration'],
      lastLogin: json['last_login'] != null ? DateTime.parse(json['last_login']) : null,
      status: json['status'] ?? 'A',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid_id': uuidId,
      'name': name,
      'email': email,
      'cellphone': cellphone,
      'birthday': birthday?.toIso8601String(),
      'gender': gender,
      'url_photo_profile': urlPhotoProfile,
      'user_profile': userProfile,
      'master_language': masterLanguage,
      'guardian_integration': guardianIntegration,
      'last_login': lastLogin?.toIso8601String(),
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
