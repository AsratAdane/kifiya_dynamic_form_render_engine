import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kifiya_dynamic_form_render_engine/kifiya_dynamic_form_render_engine.dart';
part 'form_schema.freezed.dart';
part 'form_schema.g.dart';

@freezed
abstract class FormSchema with _$FormSchema {
  const factory FormSchema({
    required String title,
    required List<FieldSchema> fields,
  }) = _FormSchema;

  factory FormSchema.fromJson(Map<String, dynamic> json) =>
      _$FormSchemaFromJson(json);
}