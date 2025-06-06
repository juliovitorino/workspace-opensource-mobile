// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_workout_plan.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserWorkoutPlanCollection on Isar {
  IsarCollection<UserWorkoutPlan> get userWorkoutPlans => this.collection();
}

const UserWorkoutPlanSchema = CollectionSchema(
  name: r'UserWorkoutPlan',
  id: 6479211840890131386,
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
  estimateSize: _userWorkoutPlanEstimateSize,
  serialize: _userWorkoutPlanSerialize,
  deserialize: _userWorkoutPlanDeserialize,
  deserializeProp: _userWorkoutPlanDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userWorkoutPlanGetId,
  getLinks: _userWorkoutPlanGetLinks,
  attach: _userWorkoutPlanAttach,
  version: '3.1.0+1',
);

int _userWorkoutPlanEstimateSize(
  UserWorkoutPlan object,
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

void _userWorkoutPlanSerialize(
  UserWorkoutPlan object,
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

UserWorkoutPlan _userWorkoutPlanDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserWorkoutPlan(
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

P _userWorkoutPlanDeserializeProp<P>(
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

Id _userWorkoutPlanGetId(UserWorkoutPlan object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _userWorkoutPlanGetLinks(UserWorkoutPlan object) {
  return [];
}

void _userWorkoutPlanAttach(
    IsarCollection<dynamic> col, Id id, UserWorkoutPlan object) {}

extension UserWorkoutPlanQueryWhereSort
    on QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QWhere> {
  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserWorkoutPlanQueryWhere
    on QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QWhereClause> {
  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterWhereClause>
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterWhereClause> idBetween(
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

extension UserWorkoutPlanQueryFilter
    on QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QFilterCondition> {
  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      commentsEqualTo(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      commentsGreaterThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      commentsLessThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      commentsBetween(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      commentsStartsWith(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      commentsEndsWith(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      commentsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      commentsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comments',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      commentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comments',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      commentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comments',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      createdAtGreaterThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      createdAtLessThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      createdAtBetween(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      customExerciseEqualTo(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      customExerciseGreaterThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      customExerciseLessThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      customExerciseBetween(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      customExerciseStartsWith(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      customExerciseEndsWith(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      customExerciseContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customExercise',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      customExerciseMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customExercise',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      customExerciseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customExercise',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      customExerciseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customExercise',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      customProgramEqualTo(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      customProgramGreaterThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      customProgramLessThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      customProgramBetween(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      customProgramStartsWith(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      customProgramEndsWith(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      customProgramContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customProgram',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      customProgramMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customProgram',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      customProgramIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customProgram',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      customProgramIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customProgram',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionEqualTo(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionGreaterThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionLessThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionBetween(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionStartsWith(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionEndsWith(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'execution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'execution',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'execution',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'execution',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionMethodEqualTo(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionMethodGreaterThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionMethodLessThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionMethodBetween(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionMethodStartsWith(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionMethodEndsWith(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionMethodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'executionMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionMethodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'executionMethod',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'executionMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'executionMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionTimeEqualTo(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionTimeGreaterThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionTimeLessThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionTimeBetween(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionTimeStartsWith(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionTimeEndsWith(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'executionTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'executionTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'executionTime',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      executionTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'executionTime',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      externalIdEqualTo(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      externalIdGreaterThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      externalIdLessThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      externalIdBetween(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      externalIdStartsWith(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      externalIdEndsWith(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      externalIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'externalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      externalIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'externalId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      externalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'externalId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      externalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'externalId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      obsEqualTo(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      obsGreaterThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      obsLessThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      obsBetween(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      obsStartsWith(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      obsEndsWith(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      obsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'obs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      obsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'obs',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      obsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'obs',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      obsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'obs',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      qtyRepsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyReps',
        value: value,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      qtyRepsGreaterThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      qtyRepsLessThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      qtyRepsBetween(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      qtySeriesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtySeries',
        value: value,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      qtySeriesGreaterThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      qtySeriesLessThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      qtySeriesBetween(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      restTimeEqualTo(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      restTimeGreaterThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      restTimeLessThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      restTimeBetween(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      restTimeStartsWith(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      restTimeEndsWith(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      restTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'restTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      restTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'restTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      restTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'restTime',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      restTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'restTime',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      statusEqualTo(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      statusGreaterThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      statusLessThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      statusBetween(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      statusStartsWith(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      statusEndsWith(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      updatedAtGreaterThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      updatedAtLessThan(
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

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterFilterCondition>
      updatedAtBetween(
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

extension UserWorkoutPlanQueryObject
    on QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QFilterCondition> {}

extension UserWorkoutPlanQueryLinks
    on QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QFilterCondition> {}

extension UserWorkoutPlanQuerySortBy
    on QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QSortBy> {
  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByCustomExercise() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customExercise', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByCustomExerciseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customExercise', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByCustomProgram() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customProgram', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByCustomProgramDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customProgram', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByExecution() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'execution', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByExecutionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'execution', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByExecutionMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executionMethod', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByExecutionMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executionMethod', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByExecutionTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executionTime', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByExecutionTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executionTime', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy> sortByObs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obs', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy> sortByObsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obs', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy> sortByQtyReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyReps', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByQtyRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyReps', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByQtySeries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtySeries', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByQtySeriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtySeries', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByRestTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restTime', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByRestTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restTime', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension UserWorkoutPlanQuerySortThenBy
    on QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QSortThenBy> {
  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comments', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByCustomExercise() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customExercise', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByCustomExerciseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customExercise', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByCustomProgram() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customProgram', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByCustomProgramDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customProgram', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByExecution() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'execution', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByExecutionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'execution', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByExecutionMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executionMethod', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByExecutionMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executionMethod', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByExecutionTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executionTime', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByExecutionTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'executionTime', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByExternalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByExternalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'externalId', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy> thenByObs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obs', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy> thenByObsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'obs', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy> thenByQtyReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyReps', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByQtyRepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyReps', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByQtySeries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtySeries', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByQtySeriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtySeries', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByRestTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restTime', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByRestTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restTime', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension UserWorkoutPlanQueryWhereDistinct
    on QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QDistinct> {
  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QDistinct> distinctByComments(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comments', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QDistinct>
      distinctByCustomExercise({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customExercise',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QDistinct>
      distinctByCustomProgram({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customProgram',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QDistinct> distinctByExecution(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'execution', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QDistinct>
      distinctByExecutionMethod({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'executionMethod',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QDistinct>
      distinctByExecutionTime({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'executionTime',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QDistinct>
      distinctByExternalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'externalId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QDistinct> distinctByObs(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'obs', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QDistinct>
      distinctByQtyReps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyReps');
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QDistinct>
      distinctByQtySeries() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtySeries');
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QDistinct> distinctByRestTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'restTime', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension UserWorkoutPlanQueryProperty
    on QueryBuilder<UserWorkoutPlan, UserWorkoutPlan, QQueryProperty> {
  QueryBuilder<UserWorkoutPlan, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserWorkoutPlan, String, QQueryOperations> commentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comments');
    });
  }

  QueryBuilder<UserWorkoutPlan, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<UserWorkoutPlan, String, QQueryOperations>
      customExerciseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customExercise');
    });
  }

  QueryBuilder<UserWorkoutPlan, String, QQueryOperations>
      customProgramProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customProgram');
    });
  }

  QueryBuilder<UserWorkoutPlan, String, QQueryOperations> executionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'execution');
    });
  }

  QueryBuilder<UserWorkoutPlan, String, QQueryOperations>
      executionMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'executionMethod');
    });
  }

  QueryBuilder<UserWorkoutPlan, String, QQueryOperations>
      executionTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'executionTime');
    });
  }

  QueryBuilder<UserWorkoutPlan, String, QQueryOperations> externalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'externalId');
    });
  }

  QueryBuilder<UserWorkoutPlan, String, QQueryOperations> obsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'obs');
    });
  }

  QueryBuilder<UserWorkoutPlan, int, QQueryOperations> qtyRepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyReps');
    });
  }

  QueryBuilder<UserWorkoutPlan, int, QQueryOperations> qtySeriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtySeries');
    });
  }

  QueryBuilder<UserWorkoutPlan, String, QQueryOperations> restTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'restTime');
    });
  }

  QueryBuilder<UserWorkoutPlan, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<UserWorkoutPlan, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
