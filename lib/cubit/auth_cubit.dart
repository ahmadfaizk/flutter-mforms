import 'package:bloc/bloc.dart';
import 'package:mforms/cubit/base_state.dart';
import 'package:mforms/model/models.dart';
import 'package:mforms/repository/mforms_repository.dart';

class AuthCubit extends Cubit<BaseState> {
  late MFormsRepository _repository;

  AuthCubit({required MFormsRepository repository})
      : _repository = repository,
        super(InitialState());

  void login(String email, String password) async {
    try {
      emit(LoadingState());
      var response = await _repository.login(email, password);
      if (response.success) {
        emit(SuccessState<Token>(data: response.data));
      } else {
        emit(ErrorState(message: response.message));
      }
    } catch (e) {
      emit(ErrorState(message: 'Error'));
    }
  }

  void register(String name, String email, String password) async {
    try {
      emit(LoadingState());
      var response = await _repository.register(name, email, password);
      if (response.success) {
        emit(SuccessState<Token>(data: response.data));
      } else {
        emit(ErrorState(message: response.message));
      }
    } catch (e) {
      emit(ErrorState(message: 'Error'));
    }
  }
}
