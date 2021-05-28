import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mforms/cubit/cubits.dart';
import 'package:mforms/model/models.dart';

class FormPage extends StatefulWidget {
  const FormPage() : super();

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FormCubit>(context).getAllForms();
  }

  Widget _generateItemForm(FormDynamic formDynamic) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('form', arguments: formDynamic.id);
      },
      child: Card(
        margin: EdgeInsets.all(16),
        child: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formDynamic.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(formDynamic.description)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<FormCubit, BaseState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return Center(child: Text(state.message));
          } else if (state is SuccessState<List<FormDynamic>>) {
            var forms = state.data ?? [];
            return ListView.builder(
              itemBuilder: (context, index) {
                var form = forms[index];
                return _generateItemForm(form);
              },
              itemCount: forms.length,
            );
          }
          return Container();
        },
      ),
    );
  }
}
