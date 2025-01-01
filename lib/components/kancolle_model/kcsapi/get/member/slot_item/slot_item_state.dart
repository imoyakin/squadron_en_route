part of 'slot_item_cubit.dart';

@freezed
class SlotItemState with _$SlotItemState {
  const factory SlotItemState.initial() = _Initial;
}

@freezed
class SoltItem with _$SoltItem {
  const factory SoltItem({
    @JsonKey(name: 'api_id') required int apiId,
    @JsonKey(name: 'api_slotitem_id') required int apiSlotitemId,
    @JsonKey(name: 'api_locked') required int apiLocked,
    @JsonKey(name: 'api_level') required int apiLevel,
  }) = _SoltItem;

  factory SoltItem.fromJson(Map<String, dynamic> json) => _$SoltItemFromJson(json);
}