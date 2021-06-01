import 'package:flutter/material.dart';
import 'package:mforms/form/form_driver.dart';
import 'package:mforms/model/form_element.dart';

class InputCheckbox extends StatefulWidget {
  final FormElement formElement;
  final ValueListener valueListener;
  final int index;

  const InputCheckbox({
    required this.formElement,
    required this.valueListener,
    required this.index,
  });

  @override
  _InputCheckboxState createState() =>
      _InputCheckboxState(formElement, valueListener, index);
}

class _InputCheckboxState extends State<InputCheckbox> {
  final FormElement formElement;
  final ValueListener valueListener;
  final int index;
  List<String> _values = [];

  _InputCheckboxState(this.formElement, this.valueListener, this.index);

  bool _getCheckboxValue(int index) {
    return _values.contains(formElement.items[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(formElement.label),
        ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: formElement.items.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              value: _getCheckboxValue(index),
              onChanged: (value) {
                if (value != null && value) {
                  _values.add(formElement.items[index]);
                } else {
                  _values.remove(formElement.items[index]);
                }
                setState(() {});
                valueListener(this.index, _values);
              },
              title: Text(formElement.items[index]),
            );
          },
        )
      ],
    );
  }
}
