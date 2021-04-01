import 'package:bloc/bloc.dart';
import 'package:mforms/cubit/base_state.dart';
import 'package:mforms/model/models.dart';
import 'package:mforms/repository/repositories.dart';

class ProfileCubit extends Cubit<BaseState> {
  late MFormsRepository _repository;

  ProfileCubit(MFormsRepository repository)
      : _repository = repository,
        super(InitialState());

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
