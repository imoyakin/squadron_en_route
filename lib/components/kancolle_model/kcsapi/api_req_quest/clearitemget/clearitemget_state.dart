part of 'clearitemget_cubit.dart';

@Freezed(
    unionKey: 'clearitemget_state_type',
    unionValueCase: FreezedUnionCase.pascal)
class ClearitemgetState with _$ClearitemgetState {
  const factory ClearitemgetState.initial() = _Initial;

  @JsonSerializable(fieldRename: FieldRename.snake)
  @FreezedUnionValue('loaded')
  const factory ClearitemgetState.loaded({
    @Default([]) @JsonKey(name: 'api_material') List<int> material,
    @Default(0) @JsonKey(name: 'api_bounus_count') int bounusCount,
  }) = _Loaded;

  factory ClearitemgetState.fromJson(Map<String, dynamic> json) =>
      _$ClearitemgetStateFromJson(json);
}

@freezed
class Bounus with _$Bounus {
  const factory Bounus({
    @Default(0) @JsonKey(name: "apt_type") int type,
    @Default(0) @JsonKey(name: "api_count") int count,
    @Default(0) @JsonKey(name: "api_item") int item,
  }) = _Bounus;

  factory Bounus.fromJson(Map<String, dynamic> json) => _$BounusFromJson(json);
}
