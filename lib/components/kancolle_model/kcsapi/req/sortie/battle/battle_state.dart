part of 'battle_cubit.dart';

@freezed
class BattleState with _$BattleState {
  const factory BattleState.initial() = _Initial;

  const factory BattleState.loaded({
    @JsonKey(name: 'api_deck_id') required int apiDeckId,
    @JsonKey(name: 'api_formation') required List<int> apiFormation,
    @JsonKey(name: 'api_f_nowhps') required List<int> apiFNowhps,
    @JsonKey(name: 'api_f_maxhps') required List<int> apiFMaxhps,
    @JsonKey(name: 'api_fParam') required List<List<int>> apiFParam,
    @JsonKey(name: 'api_ship_ke') required List<int> apiShipKe,
    @JsonKey(name: 'api_ship_lv') required List<int> apiShipLv,
    @JsonKey(name: 'api_e_nowhps') required List<int> apiENowhps,
    @JsonKey(name: 'api_e_maxhps') required List<int> apiEMaxhps,
    @JsonKey(name: 'api_eSlot') required List<List<int>> apiESlot,
    @JsonKey(name: 'api_eParam') required List<List<int>> apiEParam,
    @JsonKey(name: 'api_smoke_type') required int apiSmokeType,
    @JsonKey(name: 'api_ballon_cell') required int apiBalloonCell,
    @JsonKey(name: 'api_atoll_cell') required int apiAtollCell,
    @JsonKey(name: 'api_midnight_flag') required int apiMidnightFlag,
    @JsonKey(name: 'api_search') required List<int> apiSearch,
    @JsonKey(name: 'apit_stage_flag') required List<int> apitStageFlag,
    @JsonKey(name: 'api_kouku') required BattleKouku apiKouku, //TODO
    @JsonKey(name: 'api_support_flag') required int apiSupportFlag,
    @JsonKey(name: 'api_support_info')
    required Map<String, dynamic> apiSupportInfo, //TODO
    @JsonKey(name: 'api_opening_taisen_flag') required int apiOpeningTaisenFlag,
    @JsonKey(name: 'api_opening_taisen')
    required Map<String, dynamic> apiOpeningTaisen, //TODO
    @JsonKey(name: 'api_opening_flag') required int apiOpeningFlag,
    @JsonKey(name: 'api_opening_atack')
    required Map<String, dynamic> apiOpeningAtack, //TODO
    @JsonKey(name: 'api_hourai_flag') required List<int> apiHouraiFlag,
    @JsonKey(name: 'api_hougeki1') Map<String, dynamic>? apiHougeki1, //TODO
    @JsonKey(name: 'api_hougeki2') Map<String, dynamic>? apiHougeki2, //TODO
    @JsonKey(name: 'api_hougeki3') Map<String, dynamic>? apiHougeki3, //TODO
    @JsonKey(name: 'api_raigeki') BattleTorpedo? apiRaigeki, //TODO
  }) = _Loaded;

  factory BattleState.fromJson(Map<String, dynamic> json) =>
      _$BattleStateFromJson(json);
}

@freezed
class BattleKouku with _$BattleKouku {
  const factory BattleKouku({
    @JsonKey(name: 'api_plane_from') required List<List<int>?> apiPlaneFrom,
    @JsonKey(name: 'api_stage1') required AircraftBattleStage1 apiStage1, //TODO
    @JsonKey(name: 'api_stage2') required AircraftBattleStage2 apiStage2, //TODO
    @JsonKey(name: 'api_stage3') required AircraftBattleStage3 apiStage3, //TODO
  }) = _BattleKouku;

  factory BattleKouku.fromJson(Map<String, dynamic> json) =>
      _$BattleKoukuFromJson(json);
}

@freezed
class AircraftBattleStage1 with _$AircraftBattleStage1 {
  const factory AircraftBattleStage1({
    @JsonKey(name: 'api_f_count') int? apiFCount,
    @JsonKey(name: 'api_f_lostcount') int? apiFLostcount,
    @JsonKey(name: 'api_e_count') int? apiECount,
    @JsonKey(name: 'api_e_lostcount') int? apiELostcount,
    @JsonKey(name: 'api_disp_seiku') int? apiDispSeiku,
    @Default([]) @JsonKey(name: 'api_touch_plane') List<int?> apiTouchPlane,
  }) = _AircraftBattleStage1;

  factory AircraftBattleStage1.fromJson(Map<String, dynamic> json) =>
      _$AircraftBattleStage1FromJson(json);
}

@freezed
class AircraftBattleStage2 with _$AircraftBattleStage2 {
  const factory AircraftBattleStage2({
    @JsonKey(name: 'api_f_count') int? apiFCount,
    @JsonKey(name: 'api_f_lostcount') int? apiFLostcount,
    @JsonKey(name: 'api_e_count') int? apiECount,
    @JsonKey(name: 'api_e_lostcount') int? apiELostcount,
  }) = _AircraftBattleStage2;

  factory AircraftBattleStage2.fromJson(Map<String, dynamic> json) =>
      _$AircraftBattleStage2FromJson(json);
}

@freezed
class AircraftBattleStage3 with _$AircraftBattleStage3 {
  const factory AircraftBattleStage3({
    @Default([]) @JsonKey(name: 'api_frai_flag') List<int?> apiFraiFlag,
    @Default([]) @JsonKey(name: 'api_erai_flag') List<int?> apiEraiFlag,
    @Default([]) @JsonKey(name: 'api_fbak_flag') List<int?> apiFbakFlag,
    @Default([]) @JsonKey(name: 'api_ebak_flag') List<int?> apiEbakFlag,
    @Default([]) @JsonKey(name: 'api_fcl_flag') List<int?> apiFclFlag,
    @Default([]) @JsonKey(name: 'api_ecl_flag') List<int?> apiEclFlag,
    @Default([]) @JsonKey(name: 'api_fdam') List<int?> apiFdam,
    @Default([]) @JsonKey(name: 'api_edam') List<int?> apiEdam,
    @Default([]) @JsonKey(name: 'api_f_sp_list') List<int?> apiFSpList,
    @Default([]) @JsonKey(name: 'api_e_sp_list') List<int?> apiESpList,
  }) = _AircraftBattleStage3;

  factory AircraftBattleStage3.fromJson(Map<String, dynamic> json) =>
      _$AircraftBattleStage3FromJson(json);
}

// "api_raigeki": {
//     "api_frai": [
//         -1,
//         -1,
//         -1,
//         -1,
//         -1,
//         -1,
//         -1
//     ],
//     "api_fcl": [
//         0,
//         0,
//         0,
//         0,
//         0,
//         0,
//         0
//     ],
//     "api_fdam": [
//         0,
//         0,
//         0,
//         0,
//         0,
//         8,
//         0
//     ],
//     "api_fydam": [
//         0,
//         0,
//         0,
//         0,
//         0,
//         0,
//         0
//     ],
//     "api_erai": [
//         3,
//         4,
//         5,
//         5,
//         -1,
//         -1,
//         -1
//     ],
//     "api_ecl": [
//         0,
//         0,
//         1,
//         0,
//         0,
//         0,
//         0
//     ],
//     "api_edam": [
//         0,
//         0,
//         0,
//         0,
//         0,
//         0,
//         0
//     ],
//     "api_eydam": [
//         0,
//         0,
//         8,
//         0,
//         0,
//         0,
//         0
//     ]
// }

@freezed
class BattleTorpedo with _$BattleTorpedo {
  const factory BattleTorpedo({
    @Default([]) @JsonKey(name: 'api_frai') List<int?> apiFrai,
    @Default([]) @JsonKey(name: 'api_fcl') List<int?> apiFcl,
    @Default([]) @JsonKey(name: 'api_fdam') List<int?> apiFdam,
    @Default([]) @JsonKey(name: 'api_fydam') List<int?> apiFydam,
    @Default([]) @JsonKey(name: 'api_erai') List<int?> apiErai,
    @Default([]) @JsonKey(name: 'api_ecl') List<int?> apiEcl,
    @Default([]) @JsonKey(name: 'api_edam') List<int?> apiEdam,
    @Default([]) @JsonKey(name: 'api_eydam') List<int?> apiEydam,
  }) = _BattleTorpedo;

  factory BattleTorpedo.fromJson(Map<String, dynamic> json) =>
      _$BattleTorpedoFromJson(json);
}
