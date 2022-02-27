// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tips_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipsDetailModel _$TipsDetailModelFromJson(Map<String, dynamic> json) =>
    TipsDetailModel(
      title: json['title'] as String?,
      text: json['text'] as String?,
      mainText: json['mainText'] as String?,
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TipsDetailModelToJson(TipsDetailModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
      'mainText': instance.mainText,
      'photos': instance.photos,
    };
