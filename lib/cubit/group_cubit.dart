import 'package:bloc/bloc.dart';
import 'package:mforms/cubit/base_state.dart';
import 'package:mforms/model/group.dart';
import 'package:mforms/repository/mforms_repository.dart';

class GroupCubit extends Cubit<BaseState> {
  late MFormsRepository _repository;

  GroupCubit(MFormsRepository repository)
      : _repository = repository,
        super(InitialState());

  void getAllGroups() async {
    try {
      emit(LoadingState());
      var response = await _repository.getAllGroups();
      if (response.success) {
        emit(SuccessState<List<Group>>(data: response.data));
      } else {
        emit(ErrorState(message: response.message));
      }
    } catch (e) {
      emit(ErrorState(message: 'Error'));
    }
  }

  void subscribeGroup(String code) async {
    try {
      emit(LoadingState());
      var response = await _repository.subscribeGroup(code);
      if (response.success) {
        emit(SuccessState<Group>(data: response.data));
      } else {
        emit(ErrorState(message: response.message));
      }
    } catch (e) {
      emit(ErrorState(message: 'Error'));
    }
  }
}
