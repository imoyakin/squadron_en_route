import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unsetslot_state.dart';
part 'unsetslot_cubit.freezed.dart';
part 'unsetslot_cubit.g.dart';

class UnsetslotCubit extends Cubit<UnsetslotState> {
  UnsetslotCubit() : super(UnsetslotState.initial());
}
