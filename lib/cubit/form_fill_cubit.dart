import 'package:bloc/bloc.dart';
import 'package:mforms/cubit/base_state.dart';
import 'package:mforms/model/form_data.dart';
import 'package:mforms/repository/mforms_repository.dart';

class FormFillCubit extends Cubit<BaseState> {
  late MFormsRepository _repository;

  FormFillCubit(MFormsRepository repository)
      : _repository = repository,
        super(InitialState());

  void submitForm(int id, List<FormData> data) async {
    try {
      emit(LoadingState());
      var response = await _repository.submitForm(id, data);
      print(response);
      if (response.success) {
        emit(SuccessState<String>(data: response.message));
      } else {
        emit(ErrorState(message: response.message));
      }
    } catch (e) {
      print(e);
      emit(ErrorState(message: 'Error'));
    }
  }
}
