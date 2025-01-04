import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'start2_get_data_state.dart';
part 'start2_get_data_cubit.freezed.dart';
part 'start2_get_data_cubit.g.dart';

class Start2GetDataCubit extends Cubit<Start2GetDataState> {
  Start2GetDataCubit() : super(Start2GetDataState.initial());

  void parse(String jsonData) {
    final data = jsonDecode(jsonData);
    data['api_data']['start2_get_data_state_type'] = 'loaded';
    emit(Start2GetDataState.fromJson(data['api_data']));
  }
}
