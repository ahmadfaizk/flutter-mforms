import 'package:bloc/bloc.dart';
import 'package:mforms/cubit/base_state.dart';
import 'package:mforms/repository/repositories.dart';

class SplashCubit extends Cubit<BaseState> {
  late MFormsRepository _repository;

  SplashCubit(MFormsRepository repository)
      : _repository = repository,
        super(InitialState());

  void start() async {
    await Future.delayed(Duration(seconds: 3));
    var token = await _repository.getToken();
    emit(SuccessState<bool>(data: token != null));
  }

  void init() {
    emit(InitialState());
  }
}
