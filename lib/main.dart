import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mforms/cubit/cubits.dart';
import 'package:mforms/repository/mforms_repository.dart';
import 'package:mforms/repository/remote/remote_data_source.dart';
import 'package:mforms/ui/ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MFormsRepository _repository = new MFormsRepository(
      remoteDataSource: new RemoteDataSource(httpClient: Client()));
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (_) => LoginCubit(repository: _repository),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => SplashScreenPage()),
          GetPage(name: 'login', page: () => LoginPage()),
          GetPage(name: 'register', page: () => RegisterPage()),
        ],
      ),
    );
  }
}
