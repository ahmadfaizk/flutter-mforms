import 'package:bloc/bloc.dart';
import 'package:mforms/cubit/base_state.dart';
import 'package:mforms/repository/repositories.dart';

class FormCubit extends Cubit<BaseState> {
  late MFormsRepository _repository;

  FormCubit(MFormsRepository repository)
      : _repository = repository,
        super(InitialState());

  void getAllForms() async {
    try {
      emit(LoadingState());
      var response = await _repository.getAllForms();
      if (response.success) {
        emit(SuccessState(data: response.data));
      } else {
        emit(ErrorState(message: response.message));
      }
    } catch (e) {
      emit(ErrorState(message: 'Error'));
    }
  }
}
