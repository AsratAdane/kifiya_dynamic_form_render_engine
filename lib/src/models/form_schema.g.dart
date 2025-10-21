// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FormSchema _$FormSchemaFromJson(Map<String, dynamic> json) => _FormSchema(
  title: json['title'] as String,
  fields: (json['fields'] as List<dynamic>)
      .map((e) => FieldSchema.fromJson(e as Map<String, dynamic>))
      .toList(),
  submitApiUrl: json['submitApiUrl'] as String,
  nextFormApiUrl: json['nextFormApiUrl'] as String,
);

Map<String, dynamic> _$FormSchemaToJson(_FormSchema instance) =>
    <String, dynamic>{
      'title': instance.title,
      'fields': instance.fields,
      'submitApiUrl': instance.submitApiUrl,
      'nextFormApiUrl': instance.nextFormApiUrl,
    };
