import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../kifiya_dynamic_form_render_engine.dart';

class CheckboxFieldWidget extends ConsumerWidget {
  final FieldSchema field;
  final String? error;

  const CheckboxFieldWidget({super.key, required this.field, this.error});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(formControllerProvider.notifier);
    final value = ref.watch(formControllerProvider)[field.id] ?? false;

    return CheckboxListTile(
      title: Text(field.label),
      value: value as bool,
      onChanged: (val) => controller.updateField(field.id, val, ref),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
