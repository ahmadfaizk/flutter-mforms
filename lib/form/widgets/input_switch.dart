import 'package:flutter/material.dart';
import 'package:mforms/form/form_driver.dart';
import 'package:mforms/model/form_element.dart';

class InputSwitch extends StatefulWidget {
  final FormElement formElement;
  final ValueListener valueListener;
  final int index;
  final bool? defaultValue;
  const InputSwitch(
      {required this.formElement,
      required this.valueListener,
      required this.index,
      this.defaultValue});

  @override
  _InputSwitchState createState() =>
      _InputSwitchState(formElement, valueListener, index, defaultValue);
}

class _InputSwitchState extends State<InputSwitch> {
  final FormElement formElement;
  final ValueListener valueListener;
  final int index;
  final bool? defaultValue;
  bool valueSwitch = false;

  _InputSwitchState(
      this.formElement, this.valueListener, this.index, this.defaultValue);

  @override
  void initState() {
    super.initState();
    if (defaultValue != null) {
      valueSwitch = defaultValue!;
    }
  }

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
