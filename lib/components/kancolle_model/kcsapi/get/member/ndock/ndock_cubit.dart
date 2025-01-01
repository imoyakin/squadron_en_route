import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ndock_state.dart';
part 'ndock_cubit.freezed.dart';
part 'ndock_cubit.g.dart';

class NdockCubit extends Cubit<NdockState> {
  NdockCubit() : super(NdockState.initial());

  void parse(String jsonData) {
    final data = jsonDecode(jsonData);
    final ndocks =
        (data['api_data'] as List).map((e) => Ndock.fromJson(e)).toList();

    emit(NdockState(ndocks: ndocks));
    // TODO register notification
    // for (var ndock in ndocks) {
    //   if (ndock.api_state == 1) {
    //     _registerNdockNotification(ndock);
    //   }
    // }
  }
}
