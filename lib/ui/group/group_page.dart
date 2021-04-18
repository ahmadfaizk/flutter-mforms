import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mforms/cubit/base_state.dart';
import 'package:mforms/cubit/cubits.dart';
import 'package:mforms/model/models.dart';

class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GroupCubit>(context).getAllGroups();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupCubit, BaseState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SuccessState<List<Group>>) {
          var groups = state.data ?? [];
          return ListView.builder(
              itemBuilder: (context, index) {
                var group = groups[index];
                return Text(group.name);
              },
              itemCount: groups.length);
        } else {
          return Container();
        }
      },
    );
  }
}
