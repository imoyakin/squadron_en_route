part of 'furniture_cubit.dart';

@freezed
class FurnitureState with _$FurnitureState {
  const factory FurnitureState.initial() = _Initial;

  const factory FurnitureState.loaded({
    required List<FurnitureItem> furnitureItems,
  }) = _Loaded;

  factory FurnitureState.fromJson(Map<String, dynamic> json) =>
      _$FurnitureStateFromJson(json);
}

@freezed
class FurnitureItem with _$FurnitureItem {
  const factory FurnitureItem({
    @JsonKey(name: 'api_id') required int apiId,
    @JsonKey(name: 'api_furniture_type') required int apiFurnitureType,
    @JsonKey(name: 'api_furniture_no') required int apiFurnitureNo,
    @JsonKey(name: 'api_furniture_id') required int apiFurnitureId,
  }) = _FurnitureItem;

  factory FurnitureItem.fromJson(Map<String, dynamic> json) =>
      _$FurnitureItemFromJson(json);
}