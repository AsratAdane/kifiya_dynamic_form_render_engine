import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../kifiya_dynamic_form_render_engine.dart';

class SignatureFieldWidget extends ConsumerWidget {
  final FieldSchema field;
  final String? error;

  const SignatureFieldWidget({super.key, required this.field, this.error});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(formControllerProvider.notifier);
    final value = ref.watch(formControllerProvider)[field.id];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(field.label, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.grey[200],
          alignment: Alignment.center,
          child: const Text('Signature Pad Placeholder'),
        ),
        TextButton(
          onPressed: () {
            controller.updateField(field.id, 'signed_base64_data', ref);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Signature simulation')),
            );
          },
          child: const Text('Simulate Signature'),
        ),
        if (error != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ),
      ],
    );
  }
}
