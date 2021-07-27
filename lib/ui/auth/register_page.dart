import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mforms/component/loading_dialog.dart';
import 'package:mforms/cubit/cubits.dart';
import 'package:mforms/util/validator.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isHidePassword = true;
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? password;

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
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text('Daftar',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'Nama',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama harus diisi';
                    }
                    return null;
                  },
                  onSaved: (newValue) => name = newValue,
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
                    labelText: 'Konfirmasi Password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Konfirmasi password harus diisi';
                    }
                    return null;
                  },
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
                        BlocProvider.of<AuthCubit>(context)
                            .register(name!, email!, password!);
                      }
                    },
                    child: Text('Daftar'),
                  ),
                ),
              ),
              BlocListener<AuthCubit, BaseState>(
                listener: (context, state) {
                  if (state is SuccessState) {
                    Get.offAllNamed('home');
                    Get.back();
                  } else if (state is ErrorState) {
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
