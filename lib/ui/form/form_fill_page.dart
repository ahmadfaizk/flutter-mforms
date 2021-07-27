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
  // FormDynamic? _formDynamic;
  // FormDriver? _formDriver;

  @override
  void initState() {
    super.initState();
    int id = int.parse(Get.parameters['id'] ?? '');
    BlocProvider.of<FormFillCubit>(context).getDetailForm(id);
    // _formDynamic = Get.arguments as FormDynamic;
    //_formDriver = FormDriver(listForm: _formDynamic.elements ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Isi Formulir')),
      body: BlocConsumer<FormFillCubit, BaseState>(listener: (context, state) {
        if (state is SuccessState<String>) {
          Fluttertoast.showToast(msg: state.data ?? '');
          Get.back();
        } else if (state is ErrorState) {
          Fluttertoast.showToast(msg: state.message);
        }
      }, builder: (context, state) {
        if (state is LoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is SuccessState<FormDynamic>) {
          var formDynamic = state.data;
          var formDriver = FormDriver(listForm: formDynamic?.elements ?? []);
          return Container(
            child: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(formDynamic?.name ?? '',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          Text(
                            formDynamic?.description ?? '',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                formDriver,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formDriver.validate()) {
                        BlocProvider.of<FormFillCubit>(context).submitForm(
                            formDynamic?.id ?? 0, formDriver.getFormData());
                      } else {
                        Fluttertoast.showToast(msg: 'Form invalid');
                      }
                    },
                    child: Text('Kirim'),
                  ),
                )
              ],
            ),
          );
        }
        return Container();
      }),
    );
  }
}
