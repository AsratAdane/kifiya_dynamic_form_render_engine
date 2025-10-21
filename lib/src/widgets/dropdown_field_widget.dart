import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../kifiya_dynamic_form_render_engine.dart';

class DropdownFieldWidget extends ConsumerWidget {
  final FieldSchema field;
  final String? error;

  const DropdownFieldWidget({super.key, required this.field, this.error});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(formControllerProvider.notifier);
    final value = ref.watch(formControllerProvider)[field.id] as String?;

    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: field.label,
        border: const OutlineInputBorder(),
        errorText: error,
      ),
      items: field.options
          ?.map((o) => DropdownMenuItem(value: o, child: Text(o)))
          .toList(),
      onChanged: (val) {
        if (val != null) controller.updateField(field.id, val, ref);
      },
    );
  }
}
