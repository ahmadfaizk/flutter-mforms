import 'package:bloc/bloc.dart';
import 'package:mforms/cubit/base_state.dart';
import 'package:mforms/repository/mforms_repository.dart';

class FormDetailCubit extends Cubit<BaseState> {
  late MFormsRepository _repository;

  FormDetailCubit(MFormsRepository repository)
      : _repository = repository,
        super(InitialState());

  void getDetailForm(int id) async {
    try {
      emit(LoadingState());
      var response = await _repository.getForm(id);
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
