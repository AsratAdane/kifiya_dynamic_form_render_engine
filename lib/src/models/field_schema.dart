import 'package:freezed_annotation/freezed_annotation.dart';

part 'field_schema.freezed.dart';
part 'field_schema.g.dart';



enum FieldType {
  text,
  radio,
  dropdown,
}

@freezed
abstract class FieldSchema with _$FieldSchema {
  const factory FieldSchema({
    required String id,
    required FieldType type,
    required String label,
    @Default(false) bool required,
    List<String>? options,
    String? dependsOn,
    String? visibleWhenEquals,
  }) = _FieldSchema;

  factory FieldSchema.fromJson(Map<String, dynamic> json) =>
      _$FieldSchemaFromJson(json);
}