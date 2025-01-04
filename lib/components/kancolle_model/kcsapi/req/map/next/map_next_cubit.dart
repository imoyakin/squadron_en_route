import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_next_state.dart';
part 'map_next_cubit.freezed.dart';
part 'map_next_cubit.g.dart';

class MapNextCubit extends Cubit<MapNextState> {
  MapNextCubit() : super(MapNextState.initial());

  void parse(String jsonData) {
    final data = jsonDecode(jsonData);
    data['api_data']['map_next_state_type'] = 'loaded';
    emit(MapNextState.fromJson(data['api_data']));
  }
}
