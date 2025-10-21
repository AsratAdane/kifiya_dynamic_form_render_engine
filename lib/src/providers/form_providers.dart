
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kifiya_dynamic_form_render_engine/kifiya_dynamic_form_render_engine.dart';
import 'package:kifiya_dynamic_form_render_engine/src/providers/form_controller.dart';

final formControllerProvider = StateNotifierProvider<FormController, Map<String, dynamic>>(
      (ref) => FormController(),
);

final visibleFieldsProvider = Provider.family<List<FieldSchema>, FormSchema>(
      (ref, schema) {
    final formState = ref.watch(formControllerProvider);
    final controller = ref.read(formControllerProvider.notifier);
    return schema.fields.where((field) => controller.isFieldVisible(field, formState)).toList();
  },
);
// Reactive map of fieldId -> error message
final formErrorsProvider = StateProvider<Map<String, String>>((ref) => {});
