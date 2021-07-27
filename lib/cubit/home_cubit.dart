import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mforms/cubit/base_state.dart';

class HomeCubit extends Cubit<BaseState> {
  AppBar? _appBar;
  HomeCubit() : super(InitialState());

  void updateAppBar(AppBar appBar) {
    _appBar = appBar;
    emit(SuccessState(data: _appBar));
  }
}
