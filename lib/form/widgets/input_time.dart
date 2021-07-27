import 'package:flutter/material.dart';
import 'package:mforms/form/form_driver.dart';
import 'package:mforms/model/form_element.dart';

// ignore: must_be_immutable
class InputTime extends StatelessWidget {
  final FormElement formElement;
  final ValueListener valueListener;
  final int index;
  TimeOfDay _timeOfDay = TimeOfDay.now();
  final TextEditingController _textController = TextEditingController();

  InputTime({
    required this.formElement,
    required this.valueListener,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
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
      onTap: () => _selectTime(context),
    );
  }

  void _selectTime(BuildContext context) async {
    TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: _timeOfDay,
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!);
      },
    );
    if (timeOfDay != null) {
      _timeOfDay = timeOfDay;
      String time = "${timeOfDay.hour}:${timeOfDay.minute}";
      valueListener(index, time);
      _textController.text = time;
    }
  }
}
