part of 'start2_get_data_cubit.dart';

@Freezed(
    unionKey: 'start2_get_data_state_type',
    unionValueCase: FreezedUnionCase.pascal)
class Start2GetDataState with _$Start2GetDataState {
  const factory Start2GetDataState.initial() = _Initial;

  @JsonSerializable(fieldRename: FieldRename.snake)
  @FreezedUnionValue('loaded')
  const factory Start2GetDataState.loaded({
    @Default([]) @JsonKey(name: 'api_mst_ship') List<KancolleShip>? apiMstShip,
    @Default([])
    @JsonKey(name: 'api_mst_shipgraph')
    List<KancolleShipgraph>? apiMstShipgraph,
    @Default([])
    @JsonKey(name: 'api_mst_slotitem_equiptype')
    List<KancolleSlotitemEquiptype>? apiMstSlotitemEquiptype,
    @Default([])
    @JsonKey(name: 'api_mst_equip_exslot')
    List<int>? apiMstEquipExslot,
    @Default({})
    @JsonKey(name: 'api_mst_equip_exslot_ship')
    Map<String, KancolleMstEquipExslot>? apiMstEquipExslotShip,
    @Default([])
    @JsonKey(name: 'api_mst_stype')
    List<KancolleMstStype>? apiMstStype,
    @Default([])
    @JsonKey(name: 'api_mst_slotitem')
    List<KancolleMstStype> apiMstSlotitem,
    @Default([])
    @JsonKey(name: 'api_mst_furnituregraph')
    List<KancolleFurnituregraph>? apiMstFurnituregraph,
    @Default([])
    @JsonKey(name: 'api_mst_useitem')
    List<KancolleMstUseItem>? apiMstUseitem,
    @Default([])
    @JsonKey(name: 'api_mst_payitem')
    List<KancolleMstPayitem>? apiMstPayitem,
    @Default({})
    @JsonKey(name: 'api_mst_item_shop')
    Map<String, dynamic>? apiMstItemShop,
    @Default([])
    @JsonKey(name: 'api_mst_maparea')
    List<KancolleMstMapArea>? apiMstMaparea,
    @Default([])
    @JsonKey(name: 'api_mst_mapinfo')
    List<KancolleMstMapInfo>? apiMstMapinfo,
    @Default([])
    @JsonKey(name: 'api_mst_mapbgm')
    List<KancolleMstMapBgm>? apiMstMapbgm,
    @Default([])
    @JsonKey(name: 'api_mst_mission')
    List<KancolleMstMission>? apiMstMission,
    @Default({})
    @JsonKey(name: 'api_mst_const')
    Map<String, dynamic>? apiMstConst,
    @Default([])
    @JsonKey(name: 'api_mst_shipupgrade')
    List<KancolleMstShipUpgrade>? apiMstShipupgrade,
    @Default([]) @JsonKey(name: 'api_mst_bgm') List<KancolleMstBgm>? apiMstBgm,
    @Default([])
    @JsonKey(name: 'api_mst_equip_ship')
    List<KancolleMstEquipShip>? apiMstEquipShip,
    @Default([])
    @JsonKey(name: 'api_mst_furniture')
    List<KancolleMstFurniture>? apiMstFurniture,
  }) = _Loaded;

  factory Start2GetDataState.fromJson(Map<String, dynamic> json) =>
      _$Start2GetDataStateFromJson(json);
}

@freezed
class KancolleShip with _$KancolleShip {
  const factory KancolleShip({
    @Default(0) @JsonKey(name: 'api_id') int? apiId,
    @Default(0) @JsonKey(name: 'api_sortno') int? apiSortno,
    @Default(0) @JsonKey(name: 'api_sort_id') int? apiSortId,
    @Default('') @JsonKey(name: 'api_name') String? apiName,
    @Default('') @JsonKey(name: 'api_yomi') String? apiYomi,
    @Default(0) @JsonKey(name: 'api_stype') int? apiStype,
    @Default(0) @JsonKey(name: 'api_ctype') int? apiCtype,
    @Default(0) @JsonKey(name: 'api_afterlv') int? apiAfterlv,
    @Default('') @JsonKey(name: 'api_aftershipid') String? apiAftershipid,
    @Default([]) @JsonKey(name: 'api_taik') List<int>? apiTaik,
    @Default([]) @JsonKey(name: 'api_souk') List<int>? apiSouk,
    @Default([]) @JsonKey(name: 'api_houg') List<int>? apiHoug,
    @Default([]) @JsonKey(name: 'api_raig') List<int>? apiRaig,
    @Default([]) @JsonKey(name: 'api_tyku') List<int>? apiTyku,
    @Default([]) @JsonKey(name: 'api_luck') List<int>? apiLuck,
    @Default(0) @JsonKey(name: 'api_soku') int? apiSoku,
    @Default(0) @JsonKey(name: 'api_leng') int? apiLeng,
    @Default(0) @JsonKey(name: 'api_slot_num') int? apiSlotNum,
    @Default([]) @JsonKey(name: 'api_maxeq') List<int>? apiMaxeq,
    @Default(0) @JsonKey(name: 'api_buildtime') int? apiBuildtime,
    @Default([]) @JsonKey(name: 'api_broken') List<int>? apiBroken,
    @Default([]) @JsonKey(name: 'api_powup') List<int>? apiPowup,
    @Default(0) @JsonKey(name: 'api_backs') int? apiBacks,
    @Default('') @JsonKey(name: 'api_getmes') String? apiGetmes,
    @Default(0) @JsonKey(name: 'api_afterfuel') int? apiAfterfuel,
    @Default(0) @JsonKey(name: 'api_afterbull') int? apiAfterbull,
    @Default(0) @JsonKey(name: 'api_fuel_max') int? apiFuelMax,
    @Default(0) @JsonKey(name: 'api_bull_max') int? apiBullMax,
    @Default(0) @JsonKey(name: 'api_voicef') int? apiVoicef,
  }) = _KancolleShip;

  factory KancolleShip.fromJson(Map<String, dynamic> json) =>
      _$KancolleShipFromJson(json);
}

@freezed
class KancolleShipgraph with _$KancolleShipgraph {
  const factory KancolleShipgraph({
    @Default(0) @JsonKey(name: 'api_id') int? apiId,
    @Default('') @JsonKey(name: 'api_filename') String? filename,
    @Default([]) @JsonKey(name: 'api_version') List<String>? version,
    @Default([]) @JsonKey(name: 'api_battle_n') List<int>? battleN,
    @Default([]) @JsonKey(name: 'api_battle_d') List<int>? battleD,
    @Default(0) @JsonKey(name: 'api_sortno') int? sortno,
    @Default([]) @JsonKey(name: 'api_boko_n') List<int>? bokoN,
    @Default([]) @JsonKey(name: 'api_boko_d') List<int>? bokoD,
    @Default([]) @JsonKey(name: 'api_kaisyu_n') List<int>? kaisyuN,
    @Default([]) @JsonKey(name: 'api_kaisyu_d') List<int>? kaisyuD,
    @Default([]) @JsonKey(name: 'api_kaizo_n') List<int>? kaizoN,
    @Default([]) @JsonKey(name: 'api_kaizo_d') List<int>? kaizoD,
    @Default([]) @JsonKey(name: 'api_map_n') List<int>? mapN,
    @Default([]) @JsonKey(name: 'api_map_d') List<int>? mapD,
    @Default([]) @JsonKey(name: 'api_ensyuf_n') List<int>? ensyufN,
    @Default([]) @JsonKey(name: 'api_ensyuf_d') List<int>? ensyufD,
    @Default([]) @JsonKey(name: 'api_ensyue_n') List<int>? ensyueN,
    @Default([]) @JsonKey(name: 'api_weda') List<int>? weda,
    @Default([]) @JsonKey(name: 'api_wedb') List<int>? wedb,
    @Default([]) @JsonKey(name: 'api_pa') List<int>? pa,
  }) = _KancolleShipgraph;

  factory KancolleShipgraph.fromJson(Map<String, dynamic> json) =>
      _$KancolleShipgraphFromJson(json);
}

@freezed
class KancolleSlotitemEquiptype with _$KancolleSlotitemEquiptype {
  const factory KancolleSlotitemEquiptype({
    @Default(0) @JsonKey(name: 'api_id') int? apiId,
    @Default('') @JsonKey(name: 'api_name') String? apiName,
    @Default(0) @JsonKey(name: 'api_show_flg') int? apiShowFlg,
  }) = _KancolleSlotitemEquiptype;

  factory KancolleSlotitemEquiptype.fromJson(Map<String, dynamic> json) =>
      _$KancolleSlotitemEquiptypeFromJson(json);
}

@freezed
class KancolleMstEquipExslot with _$KancolleMstEquipExslot {
  const factory KancolleMstEquipExslot({
    @Default({}) @JsonKey(name: 'api_ship_ids') Map<String, int>? shipIds,
    @Default({}) @JsonKey(name: 'api_stypes') Map<String, int>? stypes,
    @Default({}) @JsonKey(name: 'api_ctypes') Map<String, int>? ctypes,
    @Default(0) @JsonKey(name: 'api_req_level') int? reqLevel,
  }) = _KancolleMstEquipExslot;

  factory KancolleMstEquipExslot.fromJson(Map<String, dynamic> json) =>
      _$KancolleMstEquipExslotFromJson(json);
}

@freezed
class KancolleMstStype with _$KancolleMstStype {
  const factory KancolleMstStype({
    @Default(0) @JsonKey(name: 'api_id') int? apiId,
    @Default(0) @JsonKey(name: 'api_sortno') int? apiSortno,
    @Default('') @JsonKey(name: 'api_name') String? apiName,
    @Default(0) @JsonKey(name: 'api_scnt') int? apiScnt,
    @Default(0) @JsonKey(name: 'api_kcnt') int? apiKcnt,
    @Default(<String, int>{})
    @JsonKey(name: 'api_equip_type')
    Map<String, int>? apiEquipType,
  }) = _KancolleMstStype;

  factory KancolleMstStype.fromJson(Map<String, dynamic> json) =>
      _$KancolleMstStypeFromJson(json);
}

@freezed
class KancolleFurnituregraph with _$KancolleFurnituregraph {
  const factory KancolleFurnituregraph({
    @Default(0) @JsonKey(name: 'api_id') int? apiId,
    @Default(0) @JsonKey(name: 'api_type') int? apiType,
    @Default(0) @JsonKey(name: 'api_no') int? apiNo,
    @Default('') @JsonKey(name: 'api_filename') String? apiFilename,
    @Default('') @JsonKey(name: 'api_version') String? apiVersion,
  }) = _KancolleFurnituregraph;

  factory KancolleFurnituregraph.fromJson(Map<String, dynamic> json) =>
      _$KancolleFurnituregraphFromJson(json);
}

@freezed
class KancolleMstUseItem with _$KancolleMstUseItem {
  const factory KancolleMstUseItem({
    @Default(0) @JsonKey(name: 'api_id') int? apiId,
    @Default(0) @JsonKey(name: 'api_usetype') int? apiUsetype,
    @Default(0) @JsonKey(name: 'api_category') int? apiCategory,
    @Default('') @JsonKey(name: 'api_name') String? apiName,
    @Default([]) @JsonKey(name: 'api_description') List<String>? apiDescription,
    @Default(0) @JsonKey(name: 'api_price') int? apiPrice,
  }) = _KancolleMstUseItem;

  factory KancolleMstUseItem.fromJson(Map<String, dynamic> json) =>
      _$KancolleMstUseItemFromJson(json);
}

@freezed
class KancolleMstPayitem with _$KancolleMstPayitem {
  const factory KancolleMstPayitem({
    @Default(0) @JsonKey(name: 'api_id') int? id,
    @Default(0) @JsonKey(name: 'api_type') int? type,
    @Default('') @JsonKey(name: 'api_name') String? name,
    @Default('') @JsonKey(name: 'api_description') String? description,
    @Default([]) @JsonKey(name: 'api_item') List<int>? item,
    @Default(0) @JsonKey(name: 'api_price') int? price,
  }) = _KancolleMstPayitem;

  factory KancolleMstPayitem.fromJson(Map<String, dynamic> json) =>
      _$KancolleMstPayitemFromJson(json);
}

@freezed
class KancolleMstMapArea with _$KancolleMstMapArea {
  const factory KancolleMstMapArea({
    @Default(0) @JsonKey(name: 'api_id') int? id,
    @Default('') @JsonKey(name: 'api_name') String? name,
    @Default(0) @JsonKey(name: 'api_type') int? type,
  }) = _KancolleMstMapArea;

  factory KancolleMstMapArea.fromJson(Map<String, dynamic> json) =>
      _$KancolleMstMapAreaFromJson(json);
}

@freezed
class KancolleMstMapInfo with _$KancolleMstMapInfo {
  const factory KancolleMstMapInfo({
    @Default(0) @JsonKey(name: 'api_id') int? id,
    @Default(0) @JsonKey(name: 'api_maparea_id') int? mapareaId,
    @Default(0) @JsonKey(name: 'api_no') int? no,
    @Default('') @JsonKey(name: 'api_name') String? name,
    @Default(0) @JsonKey(name: 'api_level') int? level,
    @Default('') @JsonKey(name: 'api_opetext') String? opetext,
    @Default('') @JsonKey(name: 'api_infotext') String? infotext,
    @Default([]) @JsonKey(name: 'api_item') List<int>? item,
    @Default(0) @JsonKey(name: 'api_max_maphp') int? maxMaphp,
    @Default(0) @JsonKey(name: 'api_defeat_count') int? defeatCount,
    @Default([]) @JsonKey(name: 'api_sally_flag') List<int>? sallyFlag,
  }) = _KancolleMstMapInfo;

  factory KancolleMstMapInfo.fromJson(Map<String, dynamic> json) =>
      _$KancolleMstMapInfoFromJson(json);
}

@freezed
class KancolleMstMapBgm with _$KancolleMstMapBgm {
  const factory KancolleMstMapBgm({
    @Default(0) @JsonKey(name: 'api_id') int? id,
    @Default(0) @JsonKey(name: 'api_maparea_id') int? mapareaId,
    @Default(0) @JsonKey(name: 'api_no') int? no,
    @Default(0) @JsonKey(name: 'api_moving_bgm') int? movingBgm,
    @Default([]) @JsonKey(name: 'api_map_bgm') List<int>? mapBgm,
    @Default([]) @JsonKey(name: 'api_boss_bgm') List<int>? bossBgm,
  }) = _KancolleMstMapBgm;

  factory KancolleMstMapBgm.fromJson(Map<String, dynamic> json) =>
      _$KancolleMstMapBgmFromJson(json);
}

@freezed
class KancolleMstMission with _$KancolleMstMission {
  const factory KancolleMstMission({
    @Default(0) @JsonKey(name: 'api_id') int? id,
    @Default('') @JsonKey(name: 'api_disp_no') String? dispNo,
    @Default(0) @JsonKey(name: 'api_maparea_id') int? mapareaId,
    @Default('') @JsonKey(name: 'api_name') String? name,
    @Default('') @JsonKey(name: 'api_details') String? details,
    @Default(0) @JsonKey(name: 'api_reset_type') int? resetType,
    @Default(0) @JsonKey(name: 'api_damage_type') int? damageType,
    @Default(0) @JsonKey(name: 'api_time') int? time,
    @Default(0) @JsonKey(name: 'api_deck_num') int? deckNum,
    @Default(0) @JsonKey(name: 'api_difficulty') int? difficulty,
    @Default(0.0) @JsonKey(name: 'api_use_fuel') double? useFuel,
    @Default(0) @JsonKey(name: 'api_use_bull') int? useBull,
    @Default([]) @JsonKey(name: 'api_win_item1') List<int>? winItem1,
    @Default([]) @JsonKey(name: 'api_win_item2') List<int>? winItem2,
    @Default([]) @JsonKey(name: 'api_win_mat_level') List<int>? winMatLevel,
    @Default(0) @JsonKey(name: 'api_return_flag') int? returnFlag,
    @Default([]) @JsonKey(name: 'api_sample_fleet') List<int>? sampleFleet,
  }) = _KancolleMstMission;

  factory KancolleMstMission.fromJson(Map<String, dynamic> json) =>
      _$KancolleMstMissionFromJson(json);
}
//   "api_mst_const": {
//     "api_boko_max_ships": {
//         "api_string_value": "",
//         "api_int_value": 650
//     },
//     "api_dpflag_quest": {
//         "api_string_value": "",
//         "api_int_value": 1
//     },
//     "api_parallel_quest_max": {
//         "api_string_value": "",
//         "api_int_value": 10
//     }
// },

@freezed
class KancolleMstShipUpgrade with _$KancolleMstShipUpgrade {
  const factory KancolleMstShipUpgrade({
    @Default(0) @JsonKey(name: 'api_id') int? id,
    @Default(0) @JsonKey(name: 'api_current_ship_id') int? currentShipId,
    @Default(0) @JsonKey(name: 'api_original_ship_id') int? originalShipId,
    @Default(0) @JsonKey(name: 'api_upgrade_type') int? upgradeType,
    @Default(0) @JsonKey(name: 'api_upgrade_level') int? upgradeLevel,
    @Default(0) @JsonKey(name: 'api_drawing_count') int? drawingCount,
    @Default(0) @JsonKey(name: 'api_catapult_count') int? catapultCount,
    @Default(0) @JsonKey(name: 'api_report_count') int? reportCount,
    @Default(0) @JsonKey(name: 'api_aviation_mat_count') int? aviationMatCount,
    @Default(0) @JsonKey(name: 'api_arms_mat_count') int? armsMatCount,
    @Default(0) @JsonKey(name: 'api_tech_count') int? techCount,
    @Default(0) @JsonKey(name: 'api_sortno') int? sortno,
  }) = _KancolleMstShipUpgrade;

  factory KancolleMstShipUpgrade.fromJson(Map<String, dynamic> json) =>
      _$KancolleMstShipUpgradeFromJson(json);
}

@freezed
class KancolleMstBgm with _$KancolleMstBgm {
  const factory KancolleMstBgm({
    @Default(0) @JsonKey(name: 'api_id') int? id,
    @Default('') @JsonKey(name: 'api_name') String? name,
  }) = _KancolleMstBgm;

  factory KancolleMstBgm.fromJson(Map<String, dynamic> json) =>
      _$KancolleMstBgmFromJson(json);
}

@freezed
class KancolleMstEquipShip with _$KancolleMstEquipShip {
  const factory KancolleMstEquipShip({
    @Default(0) @JsonKey(name: 'api_ship_id') int? shipId,
    @Default([]) @JsonKey(name: 'api_equip_type') List<int>? equipType,
  }) = _KancolleMstEquipShip;

  factory KancolleMstEquipShip.fromJson(Map<String, dynamic> json) =>
      _$KancolleMstEquipShipFromJson(json);
}

@freezed
class KancolleMstFurniture with _$KancolleMstFurniture {
  const factory KancolleMstFurniture({
    @Default(0) @JsonKey(name: 'api_id') int? id,
    @Default(0) @JsonKey(name: 'api_type') int? type,
    @Default(0) @JsonKey(name: 'api_no') int? no,
    @Default('') @JsonKey(name: 'api_title') String? title,
    @Default('') @JsonKey(name: 'api_description') String? description,
    @Default(0) @JsonKey(name: 'api_rarity') int? rarity,
    @Default(0) @JsonKey(name: 'api_price') int? price,
    @Default(0) @JsonKey(name: 'api_saleflg') int? saleflg,
    @Default(0) @JsonKey(name: 'api_bgm_id') int? bgmId,
    @Default(0) @JsonKey(name: 'api_version') int? version,
    @Default(0) @JsonKey(name: 'api_outside_id') int? outsideId,
    @Default(0) @JsonKey(name: 'api_active_flag') int? activeFlag,
  }) = _KancolleMstFurniture;

  factory KancolleMstFurniture.fromJson(Map<String, dynamic> json) =>
      _$KancolleMstFurnitureFromJson(json);
}
