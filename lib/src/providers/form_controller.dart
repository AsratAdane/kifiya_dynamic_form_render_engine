import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kifiya_dynamic_form_render_engine/kifiya_dynamic_form_render_engine.dart';

class FormController extends StateNotifier<Map<String, dynamic>> {
  FormController() : super({});

  /// Update a specific field value and clear error if exists
  void updateField(String id, dynamic value, WidgetRef ref) {
    state = {...state, id: value};

    // Remove the error for this field if it exists
    final errors = ref.read(formErrorsProvider.notifier);
    errors.update((e) {
      final copy = {...e};
      copy.remove(id);
      return copy;
    });
  }

  /// Validate required fields in the form schema
  Map<String, String> validate(FormSchema schema) {
    final errors = <String, String>{};

    for (var field in schema.fields) {
      final value = state[field.id];

      // Skip non-required fields
      if (!field.required) continue;

      bool isEmpty = false;

      switch (field.type) {
        case FieldType.text:
        case FieldType.dropdown:
        case FieldType.radio:
          isEmpty = value == null || value.toString().trim().isEmpty;
          break;
        case FieldType.checkbox:
          isEmpty = value != true; // must be true if required
          break;
        case FieldType.date:
          isEmpty = value == null || value.toString().isEmpty;
          break;
        case FieldType.fileUpload:
        case FieldType.signature:
          isEmpty = value == null || value.toString().isEmpty;
          break;
      }

      if (isEmpty) {
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
