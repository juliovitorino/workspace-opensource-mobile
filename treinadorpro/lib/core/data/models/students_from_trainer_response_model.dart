import 'package:treinadorpro/core/data/models/iname.dart';

class StudentsFromTrainerResponseModel implements IName {
  final String externalId;
  final String name;

  const StudentsFromTrainerResponseModel({
    required this.externalId,
    required this.name,
  });

  static String module = "StudentsFromTrainerResponse";

  factory StudentsFromTrainerResponseModel.fromJson(Map<String, dynamic> json) {
    print('$module :: parsing fromJson');

    final response = StudentsFromTrainerResponseModel(
      externalId: json['externalId'],
      name: json['name'],
    );
    print('$module :: parsing fromJson was finished successfully');

    return response;
  }

  Map<String, dynamic> toJson() {
    return {'externalId': externalId, 'name': name};
  }

  @override
  String getName() {
    return this.name;
  }
}
