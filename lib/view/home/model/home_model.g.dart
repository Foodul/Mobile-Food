// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      staticsOfMe: (json['staticsOfMe'] as List<dynamic>?)
          ?.map((e) => Statics.fromJson(e as Map<String, dynamic>))
          .toList(),
      staticsOfWorkflow: (json['staticsOfWorkflow'] as List<dynamic>?)
          ?.map((e) => Statics.fromJson(e as Map<String, dynamic>))
          .toList(),
      staticsOfSolution: (json['staticsOfSolution'] as List<dynamic>?)
          ?.map((e) => Statics.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'staticsOfMe': instance.staticsOfMe,
      'staticsOfWorkflow': instance.staticsOfWorkflow,
      'staticsOfSolution': instance.staticsOfSolution,
    };

Statics _$StaticsFromJson(Map<String, dynamic> json) => Statics(
      iId: json['_id'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$StaticsToJson(Statics instance) => <String, dynamic>{
      '_id': instance.iId,
      'total': instance.total,
    };
