import 'package:isar/isar.dart';

part 'user.g.dart'; // will be generated with build_runner

@Collection()
class User {
  final Id? id;
  final String uuidId;
  final String name;
  final String email;
  final String? cellphone;
  final DateTime? birthday;
  final String? gender; // 'M' ou 'F'
  final String? urlPhotoProfile;
  final String userProfile; // 'ADMIN', 'PERSONAL_TRAINER', 'STUDENT'
  final String masterLanguage; // 'pt-BR', 'en-US', 'es-ES'
  final String? guardianIntegration;
  final DateTime? lastLogin;
  final String status; // 'A', 'B', 'I', 'P'
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const User({
    this.id,
    required this.uuidId,
    required this.name,
    required this.email,
    this.cellphone,
    this.birthday,
    this.gender,
    this.urlPhotoProfile,
    required this.userProfile,
    required this.masterLanguage,
    this.guardianIntegration,
    this.lastLogin,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  static final User currentUser = User(
    id: 99999,
    uuidId: '5711aba6-9100-4f88-9a40-ced7bbc45d85',
    name: 'Satoshi Nakamoto',
    email: 'satoshi.nakamoto@example.com',
    cellphone: '+5511999990001',
    birthday: DateTime(1990, 5, 10),
    gender: 'F',
    urlPhotoProfile: 'https://example.com/photos/satoshi.jpg',
    userProfile: 'PERSONAL_TRAINER',
    masterLanguage: 'pt-BR',
    guardianIntegration: null,
    lastLogin: DateTime.now().subtract(const Duration(days: 1)),
    status: 'A',
    createdAt: DateTime.now().subtract(const Duration(days: 365)),
    updatedAt: DateTime.now(),
  );

  static final List<User> users = [
    User(
      id: 1,
      uuidId: 'f47ac10b-58cc-4372-a567-0e02b2c3d479',
      name: 'Alice Maria Silva',
      email: 'alice.silva@example.com',
      cellphone: '+5511999990001',
      birthday: DateTime(1990, 5, 10),
      gender: 'F',
      urlPhotoProfile: 'https://example.com/photos/alice.jpg',
      userProfile: 'PERSONAL_TRAINER',
      masterLanguage: 'pt-BR',
      guardianIntegration: null,
      lastLogin: DateTime.now().subtract(const Duration(days: 1)),
      status: 'A',
      createdAt: DateTime.now().subtract(const Duration(days: 365)),
      updatedAt: DateTime.now(),
    ),
    User(
      id: 2,
      uuidId: 'e2c56db5-dffb-48d2-b060-d0f5a71096e0',
      name: 'Bruno Ferreira',
      email: 'bruno.ferreira@example.com',
      cellphone: '+5511988880002',
      birthday: DateTime(1985, 8, 20),
      gender: 'M',
      urlPhotoProfile: 'https://example.com/photos/bruno.jpg',
      userProfile: 'STUDENT',
      masterLanguage: 'en-US',
      guardianIntegration: null,
      lastLogin: DateTime.now().subtract(const Duration(days: 2)),
      status: 'A',
      createdAt: DateTime.now().subtract(const Duration(days: 200)),
      updatedAt: DateTime.now(),
    ),
    User(
      id: 3,
      uuidId: '9a3c8d56-7e54-4a1a-939b-51b6efbfe22e',
      name: 'Carla Beatriz Souza',
      email: 'carla.souza@example.com',
      cellphone: '+5511977770003',
      birthday: DateTime(1995, 3, 15),
      gender: 'F',
      urlPhotoProfile: 'https://example.com/photos/carla.jpg',
      userProfile: 'ADMIN',
      masterLanguage: 'es-ES',
      guardianIntegration: null,
      lastLogin: DateTime.now().subtract(const Duration(days: 5)),
      status: 'A',
      createdAt: DateTime.now().subtract(const Duration(days: 500)),
      updatedAt: DateTime.now(),
    ),
    User(
      id: 4,
      uuidId: 'e2c56db5-dffb-48d2-b060-d0f5a71096e0',
      name: 'Antonio Carlos',
      email: 'antonio.carlos@example.com',
      cellphone: '+5511988880002',
      birthday: DateTime(1985, 8, 20),
      gender: 'M',
      urlPhotoProfile: 'https://example.com/photos/antonio-carlos.jpg',
      userProfile: 'STUDENT',
      masterLanguage: 'en-US',
      guardianIntegration: null,
      lastLogin: DateTime.now().subtract(const Duration(days: 2)),
      status: 'A',
      createdAt: DateTime.now().subtract(const Duration(days: 200)),
      updatedAt: DateTime.now(),
    ),
    User(
      id: 5,
      uuidId: 'e2c56db5-dffb-48d2-b060-d0f5a71096e0',
      name: 'Mayara Maravilha',
      email: 'mayara.maravilha@example.com',
      cellphone: '+5511988880002',
      birthday: DateTime(1985, 8, 20),
      gender: 'M',
      urlPhotoProfile: 'https://example.com/photos/mayara-maravilha.jpg',
      userProfile: 'STUDENT',
      masterLanguage: 'en-US',
      guardianIntegration: null,
      lastLogin: DateTime.now().subtract(const Duration(days: 2)),
      status: 'A',
      createdAt: DateTime.now().subtract(const Duration(days: 200)),
      updatedAt: DateTime.now(),
    ),
  ];
}
