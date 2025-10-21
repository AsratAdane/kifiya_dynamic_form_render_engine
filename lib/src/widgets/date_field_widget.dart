import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../kifiya_dynamic_form_render_engine.dart';

class DateFieldWidget extends ConsumerWidget {
  final FieldSchema field;
  final String? error;

  const DateFieldWidget({super.key, required this.field, this.error});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(formControllerProvider.notifier);
    final value = ref.watch(formControllerProvider)[field.id];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
              initialDate: value != null ? DateTime.parse(value) : DateTime.now(),
            );
            if (picked != null) {
              controller.updateField(field.id, picked.toIso8601String(), ref);
            }
          },
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: field.label,
              border: const OutlineInputBorder(),
              errorText: error,
            ),
            child: Text(
              value != null
                  ? (field.dateFormat != null
                  ? DateFormat(field.dateFormat).format(DateTime.parse(value))
                  : value.toString().split('T').first)
                  : 'Select Date',
              style: TextStyle(color: value != null ? Colors.black87 : Colors.black54),
            ),
          ),
        ),
      ],
    );
  }
}
