// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_workout_plan_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserWorkoutPlanEntityCollection on Isar {
  IsarCollection<UserWorkoutPlanEntity> get userWorkoutPlanEntitys =>
      this.collection();
}

const UserWorkoutPlanEntitySchema = CollectionSchema(
  name: r'UserWorkoutPlanEntity',
  id: -1255575724563913293,
  properties: {
    r'comments': PropertySchema(
      id: 0,
      name: r'comments',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'customExercise': PropertySchema(
      id: 2,
      name: r'customExercise',
      type: IsarType.string,
    ),
    r'customProgram': PropertySchema(
      id: 3,
      name: r'customProgram',
      type: IsarType.string,
    ),
    r'execution': PropertySchema(
      id: 4,
      name: r'execution',
      type: IsarType.string,
    ),
    r'executionMethod': PropertySchema(
      id: 5,
      name: r'executionMethod',
      type: IsarType.string,
    ),
    r'executionTime': PropertySchema(
      id: 6,
      name: r'executionTime',
      type: IsarType.string,
    ),
    r'externalId': PropertySchema(
      id: 7,
      name: r'externalId',
      type: IsarType.string,
    ),
    r'obs': PropertySchema(
      id: 8,
      name: r'obs',
      type: IsarType.string,
    ),
    r'qtyReps': PropertySchema(
      id: 9,
      name: r'qtyReps',
      type: IsarType.long,
    ),
    r'qtySeries': PropertySchema(
      id: 10,
      name: r'qtySeries',
      type: IsarType.long,
    ),
    r'restTime': PropertySchema(
      id: 11,
      name: r'restTime',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 12,
      name: r'status',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _userWorkoutPlanEntityEstimateSize,
  serialize: _userWorkoutPlanEntitySerialize,
  deserialize: _userWorkoutPlanEntityDeserialize,
  deserializeProp: _userWorkoutPlanEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userWorkoutPlanEntityGetId,
  getLinks: _userWorkoutPlanEntityGetLinks,
  attach: _userWorkoutPlanEntityAttach,
  version: '3.1.0+1',
);

int _userWorkoutPlanEntityEstimateSize(
  UserWorkoutPlanEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.comments.length * 3;
  bytesCount += 3 + object.customExercise.length * 3;
  bytesCount += 3 + object.customProgram.length * 3;
  bytesCount += 3 + object.execution.length * 3;
  bytesCount += 3 + object.executionMethod.length * 3;
  bytesCount += 3 + object.executionTime.length * 3;
  bytesCount += 3 + object.externalId.length * 3;
  bytesCount += 3 + object.obs.length * 3;
  bytesCount += 3 + object.restTime.length * 3;
  bytesCount += 3 + object.status.length * 3;
  return bytesCount;
}

void _userWorkoutPlanEntitySerialize(
  UserWorkoutPlanEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.comments);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.customExercise);
  writer.writeString(offsets[3], object.customProgram);
  writer.writeString(offsets[4], object.execution);
  writer.writeString(offsets[5], object.executionMethod);
  writer.writeString(offsets[6], object.executionTime);
  writer.writeString(offsets[7], object.externalId);
  writer.writeString(offsets[8], object.obs);
  writer.writeLong(offsets[9], object.qtyReps);
  writer.writeLong(offsets[10], object.qtySeries);
  writer.writeString(offsets[11], object.restTime);
  writer.writeString(offsets[12], object.status);
  writer.writeDateTime(offsets[13], object.updatedAt);
}

UserWorkoutPlanEntity _userWorkoutPlanEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserWorkoutPlanEntity(
    comments: reader.readString(offsets[0]),
    createdAt: reader.readDateTimeOrNull(offsets[1]),
    customExercise: reader.readString(offsets[2]),
    customProgram: reader.readString(offsets[3]),
    execution: reader.readString(offsets[4]),
    executionMethod: reader.readString(offsets[5]),
    executionTime: reader.readString(offsets[6]),
    externalId: reader.readString(offsets[7]),
    id: id,
    obs: reader.readString(offsets[8]),
    qtyReps: reader.readLong(offsets[9]),
    qtySeries: reader.readLong(offsets[10]),
    restTime: reader.readString(offsets[11]),
    status: reader.readString(offsets[12]),
    updatedAt: reader.readDateTimeOrNull(offsets[13]),
  );
  return object;
}

P _userWorkoutPlanEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userWorkoutPlanEntityGetId(UserWorkoutPlanEntity object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _userWorkoutPlanEntityGetLinks(
    UserWorkoutPlanEntity object) {
  return [];
}

void _userWorkoutPlanEntityAttach(
    IsarCollection<dynamic> col, Id id, UserWorkoutPlanEntity object) {}

extension UserWorkoutPlanEntityQueryWhereSort
    on QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QWhere> {
  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserWorkoutPlanEntityQueryWhere on QueryBuilder<UserWorkoutPlanEntity,
    UserWorkoutPlanEntity, QWhereClause> {
  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserWorkoutPlanEntityQueryFilter on QueryBuilder<
    UserWorkoutPlanEntity, UserWorkoutPlanEntity, QFilterCondition> {
  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> commentsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> commentsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> commentsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> commentsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'comments',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> commentsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> commentsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
          QAfterFilterCondition>
      commentsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
          QAfterFilterCondition>
      commentsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comments',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> commentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comments',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> commentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comments',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> createdAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> createdAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> customExerciseEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customExercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> customExerciseGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customExercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> customExerciseLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customExercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> customExerciseBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customExercise',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> customExerciseStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customExercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> customExerciseEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customExercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
          QAfterFilterCondition>
      customExerciseContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customExercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
          QAfterFilterCondition>
      customExerciseMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customExercise',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> customExerciseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customExercise',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> customExerciseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customExercise',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> customProgramEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customProgram',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> customProgramGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customProgram',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> customProgramLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customProgram',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> customProgramBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customProgram',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> customProgramStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customProgram',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> customProgramEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customProgram',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
          QAfterFilterCondition>
      customProgramContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customProgram',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
          QAfterFilterCondition>
      customProgramMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customProgram',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> customProgramIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customProgram',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> customProgramIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customProgram',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'execution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'execution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'execution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'execution',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'execution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'execution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
          QAfterFilterCondition>
      executionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'execution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
          QAfterFilterCondition>
      executionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'execution',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'execution',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'execution',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionMethodEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'executionMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionMethodGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'executionMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionMethodLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'executionMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionMethodBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'executionMethod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionMethodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'executionMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionMethodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'executionMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
          QAfterFilterCondition>
      executionMethodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'executionMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
          QAfterFilterCondition>
      executionMethodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'executionMethod',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'executionMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'executionMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionTimeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'executionTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionTimeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'executionTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionTimeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'executionTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionTimeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'executionTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'executionTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'executionTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
          QAfterFilterCondition>
      executionTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'executionTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
          QAfterFilterCondition>
      executionTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'executionTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'executionTime',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> executionTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'executionTime',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> externalIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'externalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> externalIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'externalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> externalIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'externalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> externalIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'externalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> externalIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'externalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> externalIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'externalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
          QAfterFilterCondition>
      externalIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'externalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
          QAfterFilterCondition>
      externalIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'externalId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> externalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'externalId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> externalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'externalId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> obsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'obs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> obsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'obs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> obsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'obs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> obsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'obs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> obsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'obs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> obsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'obs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
          QAfterFilterCondition>
      obsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'obs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
          QAfterFilterCondition>
      obsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'obs',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> obsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'obs',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> obsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'obs',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> qtyRepsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyReps',
        value: value,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> qtyRepsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyReps',
        value: value,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> qtyRepsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyReps',
        value: value,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> qtyRepsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyReps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> qtySeriesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtySeries',
        value: value,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> qtySeriesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtySeries',
        value: value,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> qtySeriesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtySeries',
        value: value,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> qtySeriesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtySeries',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> restTimeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'restTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> restTimeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'restTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> restTimeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'restTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> restTimeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'restTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> restTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'restTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> restTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'restTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
          QAfterFilterCondition>
      restTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'restTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
          QAfterFilterCondition>
      restTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'restTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> restTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'restTime',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> restTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'restTime',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> statusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> statusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> statusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
          QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
          QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity,
      QAfterFilterCondition> updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserWorkoutPlanEntityQueryObject on QueryBuilder<
    UserWorkoutPlanEntity, UserWorkoutPlanEntity, QFilterCondition> {}

extension UserWorkoutPlanEntityQueryLinks on QueryBuilder<UserWorkoutPlanEntity,
    UserWorkoutPlanEntity, QFilterCondition> {}

extension UserWorkoutPlanEntityQuerySortBy
    on QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QSortBy> {
  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByCustomExercise() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customExercise', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByCustomExerciseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customExercise', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByCustomProgram() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customProgram', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByCustomProgramDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customProgram', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByExecution() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'execution', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByExecutionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'execution', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByExecutionMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executionMethod', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByExecutionMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executionMethod', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByExecutionTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executionTime', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByExecutionTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executionTime', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByObs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obs', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByObsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obs', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByQtyReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyReps', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByQtyRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyReps', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByQtySeries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtySeries', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByQtySeriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtySeries', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByRestTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restTime', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByRestTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restTime', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension UserWorkoutPlanEntityQuerySortThenBy
    on QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QSortThenBy> {
  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByCustomExercise() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customExercise', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByCustomExerciseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customExercise', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByCustomProgram() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customProgram', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByCustomProgramDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customProgram', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByExecution() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'execution', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByExecutionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'execution', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByExecutionMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executionMethod', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByExecutionMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executionMethod', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByExecutionTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executionTime', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByExecutionTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executionTime', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByObs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obs', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByObsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obs', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByQtyReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyReps', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByQtyRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyReps', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByQtySeries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtySeries', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByQtySeriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtySeries', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByRestTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restTime', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByRestTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restTime', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension UserWorkoutPlanEntityQueryWhereDistinct
    on QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QDistinct> {
  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QDistinct>
      distinctByComments({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comments', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QDistinct>
      distinctByCustomExercise({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customExercise',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QDistinct>
      distinctByCustomProgram({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customProgram',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QDistinct>
      distinctByExecution({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'execution', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QDistinct>
      distinctByExecutionMethod({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'executionMethod',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QDistinct>
      distinctByExecutionTime({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'executionTime',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QDistinct>
      distinctByExternalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'externalId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QDistinct>
      distinctByObs({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'obs', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QDistinct>
      distinctByQtyReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyReps');
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QDistinct>
      distinctByQtySeries() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtySeries');
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QDistinct>
      distinctByRestTime({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'restTime', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, UserWorkoutPlanEntity, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension UserWorkoutPlanEntityQueryProperty on QueryBuilder<
    UserWorkoutPlanEntity, UserWorkoutPlanEntity, QQueryProperty> {
  QueryBuilder<UserWorkoutPlanEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, String, QQueryOperations>
      commentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comments');
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, String, QQueryOperations>
      customExerciseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customExercise');
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, String, QQueryOperations>
      customProgramProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customProgram');
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, String, QQueryOperations>
      executionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'execution');
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, String, QQueryOperations>
      executionMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'executionMethod');
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, String, QQueryOperations>
      executionTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'executionTime');
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, String, QQueryOperations>
      externalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'externalId');
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, String, QQueryOperations> obsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'obs');
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, int, QQueryOperations> qtyRepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyReps');
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, int, QQueryOperations>
      qtySeriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtySeries');
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, String, QQueryOperations>
      restTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'restTime');
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, String, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<UserWorkoutPlanEntity, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
