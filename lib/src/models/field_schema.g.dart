// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FieldSchema _$FieldSchemaFromJson(Map<String, dynamic> json) => _FieldSchema(
  id: json['id'] as String,
  type: $enumDecode(_$FieldTypeEnumMap, json['type']),
  label: json['label'] as String,
  required: json['required'] as bool? ?? false,
  options: (json['options'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  dependsOn: json['dependsOn'] as String?,
  visibleWhenEquals: json['visibleWhenEquals'] as String?,
);

Map<String, dynamic> _$FieldSchemaToJson(_FieldSchema instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$FieldTypeEnumMap[instance.type]!,
      'label': instance.label,
      'required': instance.required,
      'options': instance.options,
      'dependsOn': instance.dependsOn,
      'visibleWhenEquals': instance.visibleWhenEquals,
    };

const _$FieldTypeEnumMap = {
  FieldType.text: 'text',
  FieldType.radio: 'radio',
  FieldType.dropdown: 'dropdown',
};
