import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:squadron_en_route/helper/mod.dart';

part 'questlist_event.dart';
part 'questlist_state.dart';
part 'questlist_bloc.freezed.dart';
part 'questlist_bloc.g.dart';

class QuestlistBloc extends Bloc<QuestlistEvent, QuestlistState> {
  QuestlistBloc() : super(QuestlistState.initial()) {
    on<_EventInitial>((event, emit) {});
    on<_EventUpdate>((event, emit) {
      final data = jsonDecode(event.data);
      data['api_data']['questlist_type'] = 'loaded';
      QuestlistStateData questList =
          QuestlistStateData.fromJson(data['api_data']);
      state.when(
          initial: () =>
              emit(_Loaded(apiData: questList, sortOrder: SortOrder.noSort)),
          loaded: (apiData, sortOrder) {
            if (sortOrder != null) {
              questList = sort(questList, sortOrder);
            } else {
              sortOrder = SortOrder.noSort;
            }
            emit(QuestlistState.loaded(
                apiData: questList, sortOrder: sortOrder));
          });
    });

    on<_EventSort>((event, emit) {
      if (state is! _Loaded) {
        return;
      }
      var data = sort((state as _Loaded).apiData, event.sort);
      emit(QuestlistState.loaded(apiData: data, sortOrder: event.sort));
    });
  }

  QuestlistStateData sort(QuestlistStateData data, SortOrder sort) {
    switch (sort) {
      case SortOrder.ongoingAsc:
                    // apiList.sort((a, b) => b.apiState.index.compareTo(a.apiState.index));
        data.apiList.sort((a, b) => b.apiState.index.compareTo(a.apiState.index));

        break;
      case SortOrder.ongoingDesc:
        data.apiList.sort((a, b) => a.apiState.index.compareTo(b.apiState.index));
        break;
      case SortOrder.typeAsc:
        data.apiList.sort((a, b) => a.apiCategory.compareTo(b.apiCategory));
        break;
      case SortOrder.typeDesc:
        data.apiList.sort((a, b) => b.apiCategory.compareTo(a.apiCategory));
        break;
      default:
        break;
    }
    return data;
  }
}
