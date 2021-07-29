import 'package:flutter/material.dart';
import 'package:mforms/form/form_driver.dart';
import 'package:mforms/model/form_element.dart';

// ignore: must_be_immutable
class InputDate extends StatelessWidget {
  final FormElement formElement;
  final ValueListener valueListener;
  final int index;
  DateTime _selectedDate = DateTime.now();
  final String? defaultValue;
  final TextEditingController _textController = TextEditingController();

  InputDate({
    required this.formElement,
    required this.valueListener,
    required this.index,
    this.defaultValue,
  });

  @override
  Widget build(BuildContext context) {
    if (defaultValue != null) {
      _textController.text = defaultValue!;
      var dates = defaultValue!.split('-');
      _selectedDate = DateTime(
          int.parse(dates[0]), int.parse(dates[1]), int.parse(dates[2]));
    }
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _textController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          labelText: formElement.label,
          hintText: formElement.placeholder),
      readOnly: true,
      validator: (value) {
        if ((value?.isEmpty ?? false) && formElement.required) {
          return formElement.label + " harus diisi";
        }
        return null;
      },
      onTap: () => _selectDate(context),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1950),
        lastDate: DateTime(2100));
    if (datePicker != null) {
      _selectedDate = datePicker;
      String date = _selectedDate.toIso8601String().substring(0, 10);
      valueListener(index, date);
      _textController.text = date;
    }
  }
}
