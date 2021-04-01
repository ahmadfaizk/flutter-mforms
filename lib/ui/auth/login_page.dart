import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mforms/component/loading_dialog.dart';
import 'package:mforms/cubit/cubits.dart';
import 'package:mforms/util/validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidePassword = true;
  String? email;
  String? password;
  final _formKey = GlobalKey<FormState>();

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlutterLogo(
                      size: 80,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Masuk',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email harus diisi';
                    }
                    if (!Validator.isValidEmail(value)) {
                      return 'Email tidak valid';
                    }
                    return null;
                  },
                  onSaved: (newValue) => email = newValue,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: _isHidePassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_isHidePassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () => _togglePasswordVisibility(),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password harus diisi';
                    }
                    return null;
                  },
                  onSaved: (newValue) => password = newValue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Lupa Password ?'),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState?.save();
                        if (email != null && password != null) {
                          BlocProvider.of<AuthCubit>(context)
                              .login(email!, password!);
                        }
                      }
                    },
                    child: Text('Masuk'),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    Flexible(child: Divider(color: Colors.grey)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Atau',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Flexible(child: Divider(color: Colors.grey)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextButton(
                  onPressed: () => Get.toNamed('register'),
                  child: Text('Daftar'),
                ),
              ),
              BlocListener<AuthCubit, BaseState>(
                listener: (context, state) {
                  if (state is SuccessState) {
                    // Fluttertoast.showToast(msg: state.data!.user.name);
                    Get.back();
                    Get.offAllNamed('home');
                  } else if (state is ErrorState) {
                    Fluttertoast.showToast(msg: state.message);
                    Get.back();
                  }
                  if (state is LoadingState) {
                    showDialog(
                      context: context,
                      builder: (context) => LoadingDialog(),
                    );
                  }
                },
                child: Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
