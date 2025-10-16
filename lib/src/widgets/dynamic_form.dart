import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../kifiya_dynamic_form_render_engine.dart';

class DynamicForm extends ConsumerWidget {
  final FormSchema schema;
  final Function(Map<String, dynamic>) onSubmit;

  const DynamicForm({
    super.key,
    required this.schema,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visibleFields = ref.watch(visibleFieldsProvider(schema));
    final errors = ref.watch(formErrorsProvider(schema));


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          schema.title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        ...visibleFields.map((field) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _buildField(context, ref, field, errors[field.id]),
        )),
        ElevatedButton(
          onPressed: () {
            if (errors.isEmpty) {
              onSubmit(ref.read(formControllerProvider));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please fix form errors')),
              );
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }

  Widget _buildField(
      BuildContext context,
      WidgetRef ref,
      FieldSchema field,
      String? error,
      ) {
    final controller = ref.read(formControllerProvider.notifier);

    switch (field.type) {
      case FieldType.text:
        return TextFormField(
          decoration: InputDecoration(
            labelText: field.label,
            errorText: error,
          ),
          onChanged: (value) => controller.updateField(field.id, value),
        );
      case FieldType.radio:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(field.label, style: Theme.of(context).textTheme.titleMedium),
            if (error != null)
              Text(error, style: TextStyle(color: Theme.of(context).colorScheme.error)),
            ...?field.options?.map((option) => RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: ref.watch(formControllerProvider)[field.id] as String?,
              onChanged: (value) {
                if (value != null) {
                  controller.updateField(field.id, value);
                }
              },
            )),
          ],
        );
      case FieldType.dropdown:
        return DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: field.label,
            errorText: error,
          ),
          items: field.options
              ?.map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
          initialValue: ref.watch(formControllerProvider)[field.id] as String?,
          onChanged: (value) {
            if (value != null) {
              controller.updateField(field.id, value);
            }
          },
        );
      }
  }
}