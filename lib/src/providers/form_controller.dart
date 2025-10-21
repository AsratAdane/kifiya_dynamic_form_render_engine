import 'package:flutter_riverpod/legacy.dart';
import 'package:kifiya_dynamic_form_render_engine/kifiya_dynamic_form_render_engine.dart';

class FormController extends StateNotifier<Map<String, dynamic>> {
  FormController() : super({});

  /// Update a specific field value
  void updateField(String id, dynamic value) {
    state = {...state, id: value};
  }

  /// Validate required fields in the form schema
  Map<String, String> validate(FormSchema schema) {
    final errors = <String, String>{};

    for (final field in schema.fields) {
      final value = state[field.id];

      if (field.required && (value == null || value.toString().trim().isEmpty)) {
        errors[field.id] = '${field.label} is required';
      }
    }

    return errors;
  }

  dynamic getValue(String fieldId) => state[fieldId];

  /// Determine if a field should be visible based on dependency rules
  bool isFieldVisible(FieldSchema field, Map<String, dynamic> formState) {
    // No dependency → always visible
    if (field.dependsOn == null) return true;

    final dependsValue = formState[field.dependsOn];
    final condition = field.visibleWhenEquals;

    // No condition → always visible
    if (condition == null) return true;

    // If the condition is a list → check if the dependsValue is in it
    if (condition is List) {
      return condition.contains(dependsValue);
    }

    // Otherwise, check for direct equality
    return dependsValue == condition;
  }
}
