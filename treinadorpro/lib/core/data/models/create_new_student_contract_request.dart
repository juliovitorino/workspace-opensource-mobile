import 'package:json_annotation/json_annotation.dart';
import 'package:treinadorpro/core/data/models/instalment_request.dart';
import 'package:treinadorpro/core/data/models/new_student_request.dart';
import 'package:treinadorpro/core/data/models/training_info_request.dart';
import 'package:treinadorpro/core/utils/uuid_value_converter.dart';
import 'package:uuid/uuid_value.dart';

part 'create_new_student_contract_request.g.dart';

/// CreateNewStudentContractRequest
@JsonSerializable()
class CreateNewStudentContractRequest {
  @UuidValueConverter()
  final UuidValue personalTrainerExternalId;

  @UuidValueConverter()
  final UuidValue? trainingPackExternalId;

  final String? existingStudentExternalId;

  final NewStudentRequest? newStudent;
  final TrainingInfoRequest trainingInfo;
  final List<InstalmentRequest> instalments;

  CreateNewStudentContractRequest({
    required this.personalTrainerExternalId,
    required this.trainingPackExternalId,
    this.existingStudentExternalId,
    this.newStudent,
    required this.trainingInfo,
    required this.instalments,
  });

  factory CreateNewStudentContractRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateNewStudentContractRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateNewStudentContractRequestToJson(this);

  static CreateNewStudentContractRequest getInstance(
    UuidValue trainingPackExternalId,
    UuidValue personalTrainerExternalId,
    String? existingStudentExternalId,
    NewStudentRequest? newStudentRequest,
    TrainingInfoRequest trainingInfo,
    List<InstalmentRequest> instalments

  ) {
    return CreateNewStudentContractRequest(
      trainingPackExternalId: trainingPackExternalId,
      personalTrainerExternalId: personalTrainerExternalId,
      existingStudentExternalId: existingStudentExternalId,
      newStudent: newStudentRequest,
      trainingInfo: trainingInfo,
      instalments: instalments
    );
  }
}
