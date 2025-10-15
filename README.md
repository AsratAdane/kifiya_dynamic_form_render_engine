
# 🧩 kifiya_dynamic_form_render_engine

[![Pub Version](https://img.shields.io/pub/v/dynamic_form_renderer?color=blue)](https://pub.dev/packages/dynamic_form_renderer)
[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Flutter](https://img.shields.io/badge/Flutter-%E2%9D%A4-blue)](https://flutter.dev)
[![Riverpod](https://img.shields.io/badge/Riverpod-Enabled-purple)](https://riverpod.dev)

A **backend-driven dynamic form rendering engine** for Flutter — powered by **Riverpod** and **Freezed**.

Build, render, and manage **fully dynamic forms** (text fields, dropdowns, radio buttons, etc.)  
based on schemas fetched from your backend.  
No rebuilds required — change your UI dynamically by updating your backend JSON.

---

## 🚀 Features

- 🧠 **Backend-driven** form rendering (schema → UI)
- ⚙️ **Riverpod-powered state management**
- 🧊 **Freezed models** with full JSON serialization
- 🎯 Conditional visibility (e.g., show “Mother’s Name” only when gender = Female)
- ✅ Validation for required fields
- 🔄 Extensible architecture — easily add new field types (date, checkbox, etc.)
- 🧱 Designed as a **standalone library** usable across multiple projects

---

## 🏗️ Architecture Overview

```
dynamic_form_renderer/
 ├── lib/
 │    ├── src/
 │    │    ├── models/        # Freezed models: FormSchema, FieldSchema
 │    │    ├── providers/     # Riverpod logic and controller
 │    │    └── widgets/       # DynamicForm UI builder
 │    └── dynamic_form_renderer.dart
 ├── example/                 # Example Flutter app
 ├── pubspec.yaml
 └── README.md
```

---

## 📦 Installation

Add the package to your Flutter project (after you host it on GitHub):

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^3.0.0
  dynamic_form_renderer:
    git:
      url: https://github.com/AsratAdane/dynamic_form_renderer.git
```

Then run:

```bash
flutter pub get
```

---

## 🧠 How It Works

1. Backend returns a **JSON schema** describing your form.
2. The library converts it into `FormSchema` and `FieldSchema` models.
3. `DynamicForm` renders it automatically based on the schema.
4. Conditional logic (visibility) and validation are handled via **Riverpod**.

---

## 🧩 Example JSON Schema

```json
{
  "title": "User Registration",
  "fields": [
    {
      "id": "gender",
      "type": "radio",
      "label": "Gender",
      "options": ["Male", "Female"],
      "required": true
    },
    {
      "id": "motherName",
      "type": "text",
      "label": "Mother's Name",
      "dependsOn": "gender",
      "visibleWhenEquals": "Female"
    }
  ]
}
```

---

## 💡 Example Usage

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dynamic_form_renderer/dynamic_form_renderer.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final formSchema = FormSchema(
      title: "User Info",
      fields: [
        FieldSchema(
          id: "gender",
          type: FieldType.radio,
          label: "Gender",
          options: ["Male", "Female"],
        ),
        FieldSchema(
          id: "motherName",
          type: FieldType.text,
          label: "Mother's Name",
          dependsOn: "gender",
          visibleWhenEquals: "Female",
        ),
      ],
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Dynamic Form Example")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: DynamicForm(
            schema: formSchema,
            onSubmit: (values) {
              debugPrint("Form Values: $values");
            },
          ),
        ),
      ),
    );
  }
}
```

---

## 🧩 Conditional Visibility Example

✅ Gender = Male → “Mother’s Name” is hidden  
✅ Gender = Female → “Mother’s Name” appears dynamically

All logic handled automatically through the schema dependency:

```json
{
  "dependsOn": "gender",
  "visibleWhenEquals": "Female"
}
```

---

## 🧠 Under the Hood

| Layer | Description |
|-------|--------------|
| **Freezed Models** | Immutable, serializable `FormSchema` & `FieldSchema` |
| **FormController (StateNotifier)** | Manages field states, visibility, and validation |
| **Riverpod Providers** | Expose form values, visible fields, and errors |
| **DynamicForm Widget** | Renders the schema as a fully functional form UI |

---

## 🧪 Example Validation Logic

The form automatically validates required fields before submission:

```dart
if (field.required == true && (value == null || value.toString().isEmpty)) {
  errors[field.id] = '${field.label} is required';
}
```

---

## 🧰 Extending the Library

You can easily extend the form engine by adding new field types.

**Example: Add `DatePicker` support**

1. Add `date` to your `FieldType` enum.
2. Extend `_buildField()` in `DynamicForm` to handle `FieldType.date`.

---

## 🧱 Future Roadmap

- [ ] Async dropdowns (fetch options from API)
- [ ] Field-level validation rules (regex, min/max)
- [ ] Grouped fields & conditional groups
- [ ] Form serialization and submission helpers
- [ ] Theme customization (Material 3 / Cupertino)

---

## 🧑‍💻 Contributing

Pull requests are welcome!  
If you want to improve the logic, field widgets, or add new types — feel free to fork and PR.

1. Fork the repo
2. Create your branch: `git checkout -b feature/my-feature`
3. Commit changes: `git commit -m "feat: added checkbox field"`
4. Push: `git push origin feature/my-feature`
5. Open a pull request 🎉

---

## 📜 License

MIT License © 2025 [Asrat Adane](https://github.com/AsratAdane)