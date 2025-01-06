import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'practice_battle_result_state.dart';
part 'practice_battle_result_cubit.freezed.dart';
part 'practice_battle_result_cubit.g.dart';


class PracticeBattleResultCubit extends Cubit<PracticeBattleResultState> {
  PracticeBattleResultCubit() : super(PracticeBattleResultState.initial());

  void parse(String jsonData) {
    final data = jsonDecode(jsonData);
    data['api_data']['practice_battle_result_state_type'] = 'loaded';
    emit(PracticeBattleResultState.fromJson(data['api_data']));
  }
}
