import 'package:flutter/material.dart';
import 'package:mforms/model/form_dynamic.dart';

class FormDriver extends StatelessWidget {
  const FormDriver({required Key key, required List<FormDynamic> listForm})
      : _listForm = listForm,
        super(key: key);

  final List<FormDynamic> _listForm;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
