import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'questlist_state.dart';
part 'questlist_cubit.freezed.dart';
part 'questlist_cubit.g.dart';

class QuestlistCubit extends Cubit<QuestlistState> {
  QuestlistCubit() : super(QuestlistState.initial());
}
