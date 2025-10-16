
import 'package:flutter_riverpod/legacy.dart';
import 'package:kifiya_dynamic_form_render_engine/kifiya_daynamic_form_engine.dart';


class FormController extends StateNotifier<Map<String, dynamic>> {
  FormController() : super({});

  void updateField(String id, dynamic value) {
    state = {...state, id: value};
  }

  Map<String, String> validate(FormSchema schema) {
    final errors = <String, String>{};
    for (var field in schema.fields) {
      if (field.required && (state[field.id] == null || state[field.id].toString().isEmpty)) {
        errors[field.id] = '${field.label} is required';
      }
    }
    return errors;
  }

  bool isFieldVisible(FieldSchema field, Map<String, dynamic> formState) {
    if (field.dependsOn == null || field.visibleWhenEquals == null) {
      return true;
    }
    return formState[field.dependsOn] == field.visibleWhenEquals;
  }
}