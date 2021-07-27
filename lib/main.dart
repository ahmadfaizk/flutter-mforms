import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mforms/cubit/cubits.dart';
import 'package:mforms/repository/local/local_data_source.dart';
import 'package:mforms/repository/mforms_repository.dart';
import 'package:mforms/repository/remote/remote_data_source.dart';
import 'package:mforms/ui/ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MFormsRepository _repository = new MFormsRepository(
      localDataSource: new LocalDataSource(),
      remoteDataSource: new RemoteDataSource(client: Client()));
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => AuthCubit(_repository)),
        BlocProvider<SplashCubit>(create: (_) => SplashCubit(_repository)),
        BlocProvider<ProfileCubit>(create: (_) => ProfileCubit(_repository)),
        BlocProvider<GroupCubit>(create: (_) => GroupCubit(_repository)),
        BlocProvider<FormCubit>(create: (_) => FormCubit(_repository)),
        BlocProvider<FormDetailCubit>(
            create: (_) => FormDetailCubit(_repository)),
        BlocProvider<FormFillCubit>(create: (_) => FormFillCubit(_repository)),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => SplashScreenPage()),
          GetPage(name: 'login', page: () => LoginPage()),
          GetPage(name: 'register', page: () => RegisterPage()),
          GetPage(name: 'home', page: () => HomePage()),
          // GetPage(name: 'form', page: () => FormDetailPage()),
          GetPage(name: 'form/:id', page: () => FormFillPage()),
        ],
      ),
    );
  }
}
