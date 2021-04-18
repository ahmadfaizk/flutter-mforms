import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mforms/cubit/cubits.dart';
import 'package:mforms/model/models.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileCubit>(context).getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocListener<AuthCubit, BaseState>(
        listener: (context, state) {
          if (state is SuccessState<bool>) {
            if (state.data!) {
              Get.offAllNamed('/');
            }
          }
        },
        child: BlocBuilder<ProfileCubit, BaseState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return CircularProgressIndicator();
            } else if (state is SuccessState<User>) {
              var user = state.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                        child: Icon(
                          Icons.account_circle,
                          size: 100,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Text(
                      user?.name ?? '',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Text(
                      user?.email ?? '',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: ElevatedButton(
                      child: Text('Logout'),
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context).logout();
                      },
                    ),
                  ),
                ],
              );
            } else if (state is ErrorState) {
              return Text(state.message);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
