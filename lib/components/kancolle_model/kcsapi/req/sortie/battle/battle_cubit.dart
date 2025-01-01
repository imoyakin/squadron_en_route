import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_state.dart';
part 'battle_cubit.freezed.dart';
part 'battle_cubit.g.dart';

class BattleCubit extends Cubit<BattleState> {
  BattleCubit() : super(BattleState.initial());
}
