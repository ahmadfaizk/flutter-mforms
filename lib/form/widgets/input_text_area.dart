import 'package:flutter/material.dart';
import 'package:mforms/form/form_driver.dart';
import 'package:mforms/model/form_element.dart';

class InputTextArea extends StatelessWidget {
  final FormElement formElement;
  final ValueListener valueListener;
  final int index;

  const InputTextArea({
    required this.formElement,
    required this.valueListener,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          labelText: formElement.label,
          hintText: formElement.placeholder),
      keyboardType: TextInputType.multiline,
      minLines: 3,
      maxLines: 10,
      validator: (value) {
        if ((value?.isEmpty ?? false) && formElement.required) {
          return formElement.label + " harus diisi";
        }
        return null;
      },
      onChanged: (value) => valueListener(index, value),
    );
  }
}
