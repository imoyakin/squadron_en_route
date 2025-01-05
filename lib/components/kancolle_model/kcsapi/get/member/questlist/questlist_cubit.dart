import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';

part 'questlist_state.dart';
part 'questlist_cubit.freezed.dart';
part 'questlist_cubit.g.dart';

class QuestlistCubit extends Cubit<QuestlistState> {
  QuestlistCubit() : super(QuestlistState.initial());

  void parse(String jsonData) {
    final data = jsonDecode(jsonData);
    data['api_data']['questlist_type'] = 'loaded';
    emit(QuestlistState.fromJson(data['api_data']));
  }
}
