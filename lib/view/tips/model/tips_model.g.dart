// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tips_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipsModel _$TipsModelFromJson(Map<String, dynamic> json) => TipsModel(
      tipsImage: json['tipsImage'] as String?,
      title: json['title'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$TipsModelToJson(TipsModel instance) => <String, dynamic>{
      'tipsImage': instance.tipsImage,
      'title': instance.title,
      'text': instance.text,
    };
