import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mforms/cubit/base_state.dart';
import 'package:mforms/cubit/cubits.dart';
import 'package:mforms/model/models.dart';

class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  TextEditingController _codeGroubController = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GroupCubit>(context).getAllGroups();
  }

  void subscribeGrub() {
    String code = _codeGroubController.text;
    if (code.isNotEmpty) {
      BlocProvider.of<GroupCubit>(context).subscribeGroup(code);
    } else {
      Fluttertoast.showToast(msg: 'Kode grub harus diisi');
    }
  }

  void showDialogAddGrub() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                controller: _codeGroubController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: 'Kode Grub',
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  subscribeGrub();
                },
                child: Text('Kirim'),
              ),
            ),
          ],
          title: Text('Subscribe Grub Baru'),
        );
      },
    );
  }

  Widget generateItemGroub(Group group) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(group.name)],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: ElevatedButton(
            onPressed: () {
              showDialogAddGrub();
            },
            child: Text('Tambah Grub'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: BlocConsumer<GroupCubit, BaseState>(
            listener: (context, state) {
              if (state is SuccessState<Group>) {
                var group = state.data;
                Fluttertoast.showToast(
                    msg: 'Berhasil menambahkan grub ${group?.name}');
              } else if (state is ErrorState) {
                Fluttertoast.showToast(msg: state.message);
              }
            },
            builder: (context, state) {
              if (state is LoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is SuccessState<List<Group>>) {
                var groups = state.data ?? [];
                return ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    var group = groups[index];
                    return generateItemGroub(group);
                  },
                  itemCount: groups.length,
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}
