import 'package:flutter/material.dart';
import 'package:mforms/form/form_driver.dart';
import 'package:mforms/model/form_element.dart';

class InputRadio extends StatefulWidget {
  final FormElement formElement;
  final ValueListener valueListener;
  final int index;

  const InputRadio({
    required this.formElement,
    required this.valueListener,
    required this.index,
  });

  @override
  _InputRadioState createState() =>
      _InputRadioState(formElement, valueListener, index);
}

class _InputRadioState extends State<InputRadio> {
  final FormElement formElement;
  final ValueListener valueListener;
  final int index;
  String? _groupValue;

  _InputRadioState(this.formElement, this.valueListener, this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(formElement.label),
        ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(formElement.items[index]),
              leading: Radio(
                value: formElement.items[index],
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value as String?;
                  });
                  valueListener(index, value);
                },
              ),
            );
          },
        )
      ],
    );
  }
}
