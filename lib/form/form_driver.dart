import 'package:flutter/material.dart';
import 'package:mforms/form/widgets/input_text.dart';
import 'package:mforms/model/form_data.dart';
import 'package:mforms/model/form_element.dart';

typedef void ValueListener(int index, dynamic value);

// class FormDriver extends StatefulWidget {
//   const FormDriver({required this.listForm});
//
//   final List<FormElement> listForm;
//
//   @override
//   _FormDriverState createState() => _FormDriverState(listForm: listForm);
// }
//
// class _FormDriverState extends State<FormDriver> {
//   final List<FormElement> listForm;
//   final _formKey = GlobalKey<FormState>();
//
//   _FormDriverState({required this.listForm});
//   late List<FormData> _listFormData;
//
//   void updateFormValue(int index, dynamic value) {
//     this._listFormData[index].value = value;
//   }
//
//   bool validate() {
//     return _formKey.currentState?.validate() ?? false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     for (var form in listForm) {
//       _listFormData.add(FormData(label: form.label, key: form.key, value: ''));
//     }
//     return Form(
//       // key: _formKey,
//       child: Expanded(
//         child: ListView.builder(
//           shrinkWrap: true,
//           itemCount: listForm.length,
//           physics: ClampingScrollPhysics(),
//           itemBuilder: (context, index) {
//             var form = listForm[index];
//             return Container(
//               margin: EdgeInsets.all(4),
//               child: _generateForm(index, form, updateFormValue),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _generateForm(
//       int index, FormElement formElement, ValueListener valueListener) {
//     switch (formElement.formType.name) {
//       case 'text':
//         return InputText(
//             formElement: formElement,
//             valueListener: valueListener,
//             index: index);
//       default:
//         return Container();
//     }
//   }
// }

// ignore: must_be_immutable
class FormDriver extends StatelessWidget {
  final List<FormElement> listForm;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FormDriver({required this.listForm});
  final List<FormData> _listFormData = [];

  void updateFormValue(int index, dynamic value) {
    this._listFormData[index].value = value;
  }

  bool validate() {
    return _formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    for (var form in listForm) {
      _listFormData.add(FormData(label: form.label, key: form.key, value: ''));
    }
    return Form(
      key: _formKey,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: listForm.length,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          var form = listForm[index];
          return Container(
            margin: EdgeInsets.all(4),
            child: _generateForm(index, form, updateFormValue),
          );
        },
      ),
    );
  }

  Widget _generateForm(
      int index, FormElement formElement, ValueListener valueListener) {
    switch (formElement.formType.name) {
      case 'text':
        return InputText(
            formElement: formElement,
            valueListener: valueListener,
            index: index);
      default:
        return Container();
    }
  }
}
