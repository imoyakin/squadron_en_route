import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clearitemget_state.dart';
part 'clearitemget_cubit.freezed.dart';
part 'clearitemget_cubit.g.dart';

class ClearitemgetCubit extends Cubit<ClearitemgetState> {
  ClearitemgetCubit() : super(ClearitemgetState.initial());

  void parse(String jsonData) {
    final data = jsonDecode(jsonData);
    data['api_data']['clearitemget_state_type'] = 'loaded';
    emit(ClearitemgetState.fromJson(data['api_data']));
  }
}
