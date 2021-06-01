import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mforms/cubit/cubits.dart';
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
                if (_formDriver.validate()) {
                  BlocProvider.of<FormFillCubit>(context)
                      .submitForm(_formDynamic.id, _formDriver.getFormData());
                } else {
                  Fluttertoast.showToast(msg: 'Form invalid');
                }
              },
              child: Text('Kirim'),
            ),
            BlocConsumer<FormFillCubit, BaseState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container();
                }
              },
              listener: (context, state) {
                if (state is SuccessState) {
                  Fluttertoast.showToast(msg: state.data);
                  Get.back();
                } else if (state is ErrorState) {
                  Fluttertoast.showToast(msg: state.message);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
