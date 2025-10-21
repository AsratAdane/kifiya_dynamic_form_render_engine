import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../kifiya_dynamic_form_render_engine.dart';
import 'text_field_widget.dart';
import 'radio_field_widget.dart';
import 'dropdown_field_widget.dart';
import 'date_field_widget.dart';
import 'checkbox_field_widget.dart';
import 'file_field_widget.dart';
import 'signature_field_widget.dart';

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
    final errors = ref.watch(formErrorsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        const SizedBox(height: 24),
        ...visibleFields.map(
              (field) {
            final error = errors[field.id];
            switch (field.type) {
              case FieldType.text:
                return TextFieldWidget(field: field, error: error);
              case FieldType.radio:
                return RadioFieldWidget(field: field, error: error);
              case FieldType.dropdown:
                return DropdownFieldWidget(field: field, error: error);
              case FieldType.date:
                return DateFieldWidget(field: field, error: error);
              case FieldType.checkbox:
                return CheckboxFieldWidget(field: field, error: error);
              case FieldType.fileUpload:
                return FileFieldWidget(field: field, error: error,btnColor: schema.buttonColor);
              case FieldType.signature:
                return SignatureFieldWidget(field: field, error: error);
            }
          },
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style:ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Color(int.parse(schema.buttonColor))),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ) ,
            onPressed: () {
              final controller = ref.read(formControllerProvider.notifier);
              final errors = controller.validate(schema);
              ref.read(formErrorsProvider.notifier).state = errors;

              if (errors.isEmpty) {
                final values = ref.read(formControllerProvider);
                onSubmit(values);
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Text('Submit', style: TextStyle(fontSize: 16)),
            ),
          ),
        ),
      ],
    );
  }
}
