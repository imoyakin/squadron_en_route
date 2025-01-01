part of 'ndock_cubit.dart';

@freezed
class NdockState with _$NdockState {
  const factory NdockState({
    required List<Ndock> ndocks,
  }) = _NdockState;

  factory NdockState.initial() => NdockState(ndocks: []);
}

@freezed
class Ndock with _$Ndock {
  const factory Ndock({
    @JsonKey(name: 'api_member_id') required int apiMemberId,
    @JsonKey(name: 'api_id') required int apiId,
    @JsonKey(name: 'api_state') required int apiState,
    @JsonKey(name: 'api_ship_id') required int apiShipId,
    @JsonKey(name: 'api_complete_time') required int apiCompleteTime,
    @JsonKey(name: 'api_complete_time_str') required String apiCompleteTimeStr,
    @JsonKey(name: 'api_item1') required int apiItem1,
    @JsonKey(name: 'api_item2') required int apiItem2,
    @JsonKey(name: 'api_item3') required int apiItem3,
    @JsonKey(name: 'api_item4') required int apiItem4,
  }) = _Ndock;

  factory Ndock.fromJson(Map<String, dynamic> json) => _$NdockFromJson(json);
}