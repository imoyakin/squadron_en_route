import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kancolle_port_state.dart';
part 'kancolle_port_cubit.freezed.dart';
part 'kancolle_port_cubit.g.dart';

class KancollePortCubit extends Cubit<KancollePortState> {
  KancollePortCubit() : super(KancollePortState.initial());

  void parse(String jsonData) {
    final data = jsonDecode(jsonData); 
    data['api_data']['kancolle_port_state_type'] = 'loaded';
    emit(KancollePortState.fromJson(data['api_data']));
  }
}
