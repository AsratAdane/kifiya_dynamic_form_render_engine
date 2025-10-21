import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../kifiya_dynamic_form_render_engine.dart';

class TextFieldWidget extends ConsumerWidget {
  final FieldSchema field;
  final String? error;

  const TextFieldWidget({super.key, required this.field, this.error});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(formControllerProvider.notifier);
    final value = ref.watch(formControllerProvider)[field.id] ?? '';

    return TextFormField(
      initialValue: value,
      decoration: InputDecoration(
        labelText: field.label,
        border: const OutlineInputBorder(),
        errorText: error,
      ),
      onChanged: (val) => controller.updateField(field.id, val, ref),
    );
  }
}
