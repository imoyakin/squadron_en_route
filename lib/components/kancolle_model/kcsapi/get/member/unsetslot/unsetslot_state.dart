part of 'unsetslot_cubit.dart';

@freezed
class UnsetslotState with _$UnsetslotState {
  const factory UnsetslotState.initial() = _Initial;

  const factory UnsetslotState.loaded({
    required Map<String,List<int>> slotItems,
  }) = _Loaded;

  factory UnsetslotState.fromJson(Map<String, dynamic> json) =>
      _$UnsetslotStateFromJson(json);
}