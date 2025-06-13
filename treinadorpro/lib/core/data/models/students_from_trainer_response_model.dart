import 'package:treinadorpro/core/data/models/iname.dart';

class StudentsFromTrainerResponseModel implements IName {
  final String externalId;
  final String name;
  final String email;
  final String phone;

  const StudentsFromTrainerResponseModel({
    required this.externalId,
    required this.name,
    required this.email,
    required this.phone
  });

  static String module = "StudentsFromTrainerResponse";

  factory StudentsFromTrainerResponseModel.fromJson(Map<String, dynamic> json) {
    print('$module :: parsing fromJson');

    final response = StudentsFromTrainerResponseModel(
      externalId: json['externalId'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
    print('$module :: parsing fromJson was finished successfully');

    return response;
  }

  Map<String, dynamic> toJson() {
    return {
      'externalId': externalId,
      'name': name,
      'email': email,
      'phone': phone
    };
  }

  @override
  String getName() {
    return this.name;
  }
}
