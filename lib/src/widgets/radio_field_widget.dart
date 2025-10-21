import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kifiya_dynamic_form_render_engine/kifiya_dynamic_form_render_engine.dart';


class RadioFieldWidget extends ConsumerWidget {
  final FieldSchema field;
  final String? error;

  const RadioFieldWidget({super.key, required this.field, this.error});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(formControllerProvider.notifier);
    final value = ref.watch(formControllerProvider)[field.id] as String?;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(field.label, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 4),
        ...?field.options?.map(
              (option) => RadioListTile<String>(
            contentPadding: EdgeInsets.zero,
            title: Text(option),
            value: option,
            groupValue: value,
            onChanged: (val) {
              if (val != null) controller.updateField(field.id, val, ref);
            },
          ),
        ),
        if (error != null)
        Text(error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
      ],
    );
  }
}
