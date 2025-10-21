import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kifiya_dynamic_form_render_engine/src/providers/form_controller.dart';
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
    final value = ref.watch(formControllerProvider)[field.id];
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
      case FieldType.date:
        return _buildDatePicker(context, field, value, controller);
      case FieldType.checkbox:
        return CheckboxListTile(
          title: Text(field.label),
          value: (value ?? false) as bool,
          onChanged: (val) => controller.updateField(field.id, val),
        );
      case FieldType.fileUpload:
        return _buildFileUpload(context, field, value, controller);

      case FieldType.signature:
        return _buildSignatureField(context, field, value, controller);
    }
  }

  Widget _buildDatePicker(
      BuildContext context,
      FieldSchema field,
      dynamic value,
      FormController controller,
      ) {
    return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
          initialDate: DateTime.now(),
        );
        if (picked != null) {
          controller.updateField(field.id, picked.toIso8601String());
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(labelText: field.label),
        child: Text(
          value != null
              ? (field.dateFormat != null
              ? DateFormat(field.dateFormat).format(DateTime.parse(value))
              : value.toString().split('T').first)
              : 'Select Date',
        ),
      ),
    );
  }
  Widget _buildFileUpload(
      BuildContext context,
      FieldSchema field,
      dynamic value,
      FormController controller,
      ) {
    return ListTile(
      title: Text(field.label),
      subtitle: Text(value ?? 'No file selected'),
      trailing: ElevatedButton(
        onPressed: () {
          // TODO: integrate real file picker later
          controller.updateField(field.id, 'file_placeholder.txt');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                backgroundColor: Colors.green,
                content: Text('Coming soon')
            ),
          );
        },
        child: const Text('Choose File'),
      ),
    );
  }

  Widget _buildSignatureField(
      BuildContext context,
      FieldSchema field,
      dynamic value,
      FormController controller,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(field.label),
        const SizedBox(height: 8),
        Container(
          height: 100,
          color: Colors.grey[200],
          alignment: Alignment.center,
          child: const Text('Signature Pad Placeholder'),
        ),
        TextButton(
          onPressed: () {
            // TODO: integrate signature capture package later
            controller.updateField(field.id, 'signed_base64_data');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Coming soon')
              ),
            );
          },
          child: const Text('Simulate Signature'),
        ),
      ],
    );
  }


}