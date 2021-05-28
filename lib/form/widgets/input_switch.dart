import 'package:flutter/material.dart';
import 'package:mforms/form/form_driver.dart';
import 'package:mforms/model/form_element.dart';

class InputSwitch extends StatefulWidget {
  final FormElement formElement;
  final ValueListener valueListener;
  final int index;
  const InputSwitch({
    required this.formElement,
    required this.valueListener,
    required this.index,
  });

  @override
  _InputSwitchState createState() =>
      _InputSwitchState(formElement, valueListener, index);
}

class _InputSwitchState extends State<InputSwitch> {
  final FormElement formElement;
  final ValueListener valueListener;
  final int index;
  bool valueSwitch = false;

  _InputSwitchState(this.formElement, this.valueListener, this.index);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(formElement.label),
        Switch(
          value: valueSwitch,
          onChanged: (value) {
            setState(() {
              this.valueSwitch = value;
              valueListener(index, value);
            });
          },
        )
      ],
    );
  }
}
