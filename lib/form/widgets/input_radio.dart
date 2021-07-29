import 'package:flutter/material.dart';
import 'package:mforms/form/form_driver.dart';
import 'package:mforms/model/form_element.dart';

class InputRadio extends StatefulWidget {
  final FormElement formElement;
  final ValueListener valueListener;
  final int index;
  final String? defaultValue;

  const InputRadio({
    required this.formElement,
    required this.valueListener,
    required this.index,
    this.defaultValue,
  });

  @override
  _InputRadioState createState() =>
      _InputRadioState(formElement, valueListener, index, defaultValue);
}

class _InputRadioState extends State<InputRadio> {
  final FormElement formElement;
  final ValueListener valueListener;
  final int index;
  String? _groupValue;
  final String? defaultValue;

  _InputRadioState(
      this.formElement, this.valueListener, this.index, this.defaultValue);

  @override
  void initState() {
    super.initState();
    _groupValue = defaultValue;
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
            return ListTile(
              title: Text(formElement.items[index].label),
              leading: Radio(
                value: formElement.items[index].value,
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value as String?;
                  });
                  valueListener(this.index, value);
                },
              ),
            );
          },
        )
      ],
    );
  }
}
