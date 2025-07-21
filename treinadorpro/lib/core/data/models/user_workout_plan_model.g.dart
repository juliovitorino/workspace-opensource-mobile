// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_workout_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserWorkoutPlanModel _$UserWorkoutPlanModelFromJson(
        Map<String, dynamic> json) =>
    UserWorkoutPlanModel(
      id: (json['id'] as num?)?.toInt(),
      externalId: json['externalId'] as String?,
      contract: ContractResponseModel.fromJson(
          json['contract'] as Map<String, dynamic>),
      modality: json['modality'] == null
          ? null
          : ModalityModel.fromJson(json['modality'] as Map<String, dynamic>),
      goal: json['goal'] == null
          ? null
          : GoalModel.fromJson(json['goal'] as Map<String, dynamic>),
      program: json['program'] == null
          ? null
          : ProgramModel.fromJson(json['program'] as Map<String, dynamic>),
      workGroup:
          WorkgroupModel.fromJson(json['workGroup'] as Map<String, dynamic>),
      exercise: json['exercise'] == null
          ? null
          : ExerciseModel.fromJson(json['exercise'] as Map<String, dynamic>),
      customExercise: json['customExercise'] as String?,
      customProgram: json['customProgram'] as String?,
      executionMethod: $enumDecodeNullable(
          _$ExecutionMethodEnumMap, json['executionMethod']),
      qtySeries: (json['qtySeries'] as num?)?.toInt(),
      qtyReps: (json['qtyReps'] as num?)?.toInt(),
      execution: json['execution'] as String?,
      executionTime: json['executionTime'] as String?,
      restTime: json['restTime'] as String?,
      weight: (json['weight'] as num?)?.toInt(),
      weightUnit: json['weightUnit'] as String?,
      comments: json['comments'] as String?,
      obs: json['obs'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      control: json['control'] as String?,
    );

Map<String, dynamic> _$UserWorkoutPlanModelToJson(
        UserWorkoutPlanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'externalId': instance.externalId,
      'contract': instance.contract,
      'modality': instance.modality,
      'goal': instance.goal,
      'program': instance.program,
      'workGroup': instance.workGroup,
      'exercise': instance.exercise,
      'customExercise': instance.customExercise,
      'customProgram': instance.customProgram,
      'executionMethod': _$ExecutionMethodEnumMap[instance.executionMethod],
      'qtySeries': instance.qtySeries,
      'qtyReps': instance.qtyReps,
      'execution': instance.execution,
      'executionTime': instance.executionTime,
      'restTime': instance.restTime,
      'weight': instance.weight,
      'weightUnit': instance.weightUnit,
      'comments': instance.comments,
      'obs': instance.obs,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'control': instance.control,
    };

const _$ExecutionMethodEnumMap = {
  ExecutionMethod.circuito: 'circuito',
  ExecutionMethod.serie: 'serie',
  ExecutionMethod.biSet: 'biSet',
  ExecutionMethod.triSet: 'triSet',
  ExecutionMethod.dropSet: 'dropSet',
  ExecutionMethod.piramide: 'piramide',
  ExecutionMethod.cluster: 'cluster',
  ExecutionMethod.livre: 'livre',
  ExecutionMethod.tempoCorrente: 'tempoCorrente',
  ExecutionMethod.isometrico: 'isometrico',
  ExecutionMethod.isocinetico: 'isocinetico',
  ExecutionMethod.pliometrico: 'pliometrico',
  ExecutionMethod.emom: 'emom',
  ExecutionMethod.amrap: 'amrap',
  ExecutionMethod.tabata: 'tabata',
  ExecutionMethod.descansoAtivo: 'descansoAtivo',
  ExecutionMethod.intervalo: 'intervalo',
  ExecutionMethod.tempoAlvo: 'tempoAlvo',
  ExecutionMethod.repMaxima: 'repMaxima',
  ExecutionMethod.combinado: 'combinado',
  ExecutionMethod.funcional: 'funcional',
  ExecutionMethod.resistido: 'resistido',
  ExecutionMethod.semCarga: 'semCarga',
};
