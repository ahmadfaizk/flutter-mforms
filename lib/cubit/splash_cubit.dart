import 'package:bloc/bloc.dart';
import 'package:mforms/cubit/base_state.dart';
import 'package:mforms/model/models.dart';
import 'package:mforms/repository/repositories.dart';

class SplashCubit extends Cubit<BaseState> {
  late MFormsRepository _repository;

  SplashCubit(MFormsRepository repository)
      : _repository = repository,
        super(InitialState());

  void start() async {
    await Future.delayed(Duration(seconds: 3));
    var token = await _repository.getToken();
    print(token);
    if (token != null) {
      emit(SuccessState<String>(data: token));
    } else {
      emit(ErrorState(message: 'Belum login'));
    }
  }

  void getUser() async {
    try {
      emit(LoadingState());
      var response = await _repository.getUser();
      if (response.success) {
        emit(SuccessState<User>(data: response.data));
      } else {
        emit(ErrorState(message: response.message));
      }
    } catch (e) {
      emit(ErrorState(message: 'Error'));
    }
  }
}
