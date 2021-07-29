import 'package:flutter/material.dart';
import 'package:mforms/form/form_driver.dart';
import 'package:mforms/model/form_element.dart';

class InputDropdown extends StatefulWidget {
  final FormElement formElement;
  final ValueListener valueListener;
  final String? defaultValue;
  final int index;

  const InputDropdown({
    required this.formElement,
    required this.valueListener,
    required this.index,
    this.defaultValue,
  });

  @override
  _InputDropdownState createState() =>
      _InputDropdownState(formElement, valueListener, index, defaultValue);
}

class _InputDropdownState extends State<InputDropdown> {
  final FormElement formElement;
  final ValueListener valueListener;
  final int index;
  final String? defaultValue;
  String? _value;

  _InputDropdownState(
      this.formElement, this.valueListener, this.index, this.defaultValue);

  @override
  void initState() {
    super.initState();
    _value = defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: formElement.label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _value,
          isDense: true,
          onChanged: (value) {
            setState(() {
              _value = value;
              valueListener(index, value);
            });
          },
          items: formElement.items.map((val) {
            return DropdownMenuItem(child: Text(val.label), value: val.value);
          }).toList(),
        ),
      ),
    );
  }
}
