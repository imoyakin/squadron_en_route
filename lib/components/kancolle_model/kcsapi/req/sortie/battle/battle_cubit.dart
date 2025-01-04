import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_state.dart';
part 'battle_cubit.freezed.dart';
part 'battle_cubit.g.dart';

class BattleCubit extends Cubit<BattleState> {
  BattleCubit() : super(BattleState.initial());

  void parse(String jsonData) {
    final data = jsonDecode(jsonData);
    data['api_data']['battle_state_type'] = 'loaded';
    emit(BattleState.fromJson(data['api_data']));
  }
}
