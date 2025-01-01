import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'slot_item_state.dart';
part 'slot_item_cubit.freezed.dart';
part 'slot_item_cubit.g.dart';

class SlotItemCubit extends Cubit<SlotItemState> {
  SlotItemCubit() : super(SlotItemState.initial());
}
