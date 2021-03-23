import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mforms/model/models.dart';
import 'package:mforms/repository/mforms_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  late MFormsRepository _repository;

  LoginCubit({required MFormsRepository repository})
      : _repository = repository,
        super(LoginInitial());

  void login(String email, String password) async {
    try {
      emit(LoginLoading());
      var response = await _repository.login(email, password);
      if (response.success) {
        emit(LoginSuccess(token: response.data));
      } else {
        emit(LoginError(message: response.message));
      }
    } catch (e) {
      emit(LoginError(message: 'Error'));
    }
  }
}
