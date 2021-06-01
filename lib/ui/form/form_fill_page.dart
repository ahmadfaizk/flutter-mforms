import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mforms/form/form_driver.dart';
import 'package:mforms/model/form_dynamic.dart';

class FormFillPage extends StatefulWidget {
  const FormFillPage() : super();

  @override
  _FormFillPageState createState() => _FormFillPageState();
}

class _FormFillPageState extends State<FormFillPage> {
  late FormDynamic _formDynamic;
  late FormDriver _formDriver;

  @override
  void initState() {
    super.initState();
    _formDynamic = Get.arguments as FormDynamic;
    _formDriver = FormDriver(listForm: _formDynamic.elements ?? []);
    print(_formDynamic.elements);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Isi Form ini')),
      body: Container(
        child: ListView(
          children: [
            Text(_formDynamic.name),
            Text(_formDynamic.description),
            _formDriver,
            ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(
                    msg: _formDriver.getFormData().toString());
              },
              child: Text('Kirim'),
            ),
          ],
        ),
      ),
    );
  }
}
