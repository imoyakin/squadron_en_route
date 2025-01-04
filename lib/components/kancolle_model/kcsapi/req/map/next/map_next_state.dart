part of 'map_next_cubit.dart';

@Freezed(
    unionKey: 'map_next_state_type', unionValueCase: FreezedUnionCase.pascal)
class MapNextState with _$MapNextState {
  const factory MapNextState.initial() = _Initial;

  @JsonSerializable(fieldRename: FieldRename.snake)
  @FreezedUnionValue('loaded')
  const factory MapNextState.loaded({
    @JsonKey(name: 'api_rashin_flg') required int apiRashinFlg,
    @JsonKey(name: 'api_rashin_id') required int apiRashinId,
    @JsonKey(name: 'api_maparea_id') required int apiMapareaId,
    @JsonKey(name: 'api_mapinfo_no') required int apiMapinfoNo,
    @JsonKey(name: 'api_no') required int apiNo,
    @JsonKey(name: 'api_color_no') required int apiColorNo,
    @JsonKey(name: 'api_event_id') required int apiEventId,
    @JsonKey(name: 'api_event_kind') required int apiEventKind,
    @JsonKey(name: 'api_next') required int apiNext,
    @JsonKey(name: 'api_bosscell_no') required int apiBosscellNo,
    @JsonKey(name: 'api_bosscomp') required int apiBosscomp,
    @JsonKey(name: 'api_comment_kind') required int apiCommentKind,
    @JsonKey(name: 'api_production_kind') required int apiProductionKind,
    @JsonKey(name: 'api_airsearch') required MapAirsearch apiAirsearch,
    @JsonKey(name: 'api_e_deck_info') required List<MapEDeckInfo> apiEDeckInfo,
    @JsonKey(name: 'api_limit_state') required int apiLimitState,
    @JsonKey(name: 'api_ration_flag') required int apiRationFlag,
  }) = _Loading;

  factory MapNextState.fromJson(Map<String, dynamic> json) =>
      _$MapNextStateFromJson(json);
}

@freezed
class MapAirsearch with _$MapAirsearch {
  const factory MapAirsearch({
    @JsonKey(name: 'api_plane_type') required int apiPlaneType,
    @JsonKey(name: 'api_result') required int apiResult,
  }) = _MapAirsearch;

  factory MapAirsearch.fromJson(Map<String, dynamic> json) =>
      _$MapAirsearchFromJson(json);
}

@freezed
class MapEDeckInfo with _$MapEDeckInfo {
  const factory MapEDeckInfo({
    @JsonKey(name: 'api_kind') required int apiKind,
    @JsonKey(name: 'api_ship_ids') required List<int> apiShipIds,
  }) = _MapEDeckInfo;

  factory MapEDeckInfo.fromJson(Map<String, dynamic> json) =>
      _$MapEDeckInfoFromJson(json);
}
