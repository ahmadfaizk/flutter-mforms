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
        Get.toNamed('form/${formDynamic.id}');
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
            margin: EdgeInsets.all(8),
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/images/checklist.png'),
                  width: 60,
                  height: 60,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formDynamic.name,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(formDynamic.description),
                    ],
                  ),
                ),
              ],
            )),
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
            if (forms.isNotEmpty) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  var form = forms[index];
                  return _generateItemForm(form);
                },
                itemCount: forms.length,
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.not_interested,
                      size: 50,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Belum ada formulir',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}
