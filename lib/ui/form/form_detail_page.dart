import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mforms/cubit/base_state.dart';
import 'package:mforms/cubit/form_detail_cubit.dart';
import 'package:mforms/model/models.dart';

class FormDetailPage extends StatefulWidget {
  const FormDetailPage() : super();

  @override
  _FormDetailPageState createState() => _FormDetailPageState();
}

class _FormDetailPageState extends State<FormDetailPage> {
  late int formId;
  @override
  void initState() {
    super.initState();
    formId = Get.arguments as int;
    BlocProvider.of<FormDetailCubit>(context).getDetailForm(formId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Form')),
      body: BlocBuilder<FormDetailCubit, BaseState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return Center(child: Text(state.message));
          } else if (state is SuccessState<FormDynamic>) {
            var form = state.data;
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    form?.name ?? '-',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(form?.description ?? '-')
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: BlocBuilder<FormDetailCubit, BaseState>(
        builder: (context, state) {
          if (state is SuccessState<FormDynamic>) {
            var data = state.data;
            return FloatingActionButton(
              onPressed: () {
                Get.toNamed('form/fill', arguments: data);
              },
              child: Icon(Icons.edit),
              tooltip: 'Isi Formulir',
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
