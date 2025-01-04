part of 'kancolle_port_cubit.dart';

@Freezed(
    unionKey: 'kancolle_port_state_type',
    unionValueCase: FreezedUnionCase.pascal)
class KancollePortState with _$KancollePortState {
  const factory KancollePortState.initial() = _KancollePortStateInitial;

  @JsonSerializable(fieldRename: FieldRename.snake)
  @FreezedUnionValue('loaded')
  const factory KancollePortState.loaded({
    required List<ApiMaterial> apiMaterial,
    required List<ApiDeckPort> apiDeckPort,
    required List<ApiNDock> apiNdock,
    required List<ApiShip> apiShip,
    required ApiBasic apiBasic,
    required List<ApiLog> apiLog,
    required int apiPBgmId,
    // required int apiFurnitureAffectItems,
    required int apiParallelQuestCount,
    required int apiDestShipSlot,
  }) = _KancollePortStateLoaded;

  factory KancollePortState.fromJson(Map<String, dynamic> json) =>
      _$KancollePortStateFromJson(json);
}

@freezed
class ApiMaterial with _$ApiMaterial {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ApiMaterial({
    required int apiMemberId,
    required int apiId,
    required int apiValue,
  }) = _ApiMaterial;

  factory ApiMaterial.fromJson(Map<String, dynamic> json) =>
      _$ApiMaterialFromJson(json);
}

@freezed
class ApiDeckPort with _$ApiDeckPort {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ApiDeckPort({
    required int apiMemberId,
    required int apiId,
    required String apiName,
    required String apiNameId,
    required List<int> apiMission,
    required String apiFlagship,
    required List<int> apiShip,
  }) = _ApiDeckPort;

  factory ApiDeckPort.fromJson(Map<String, dynamic> json) =>
      _$ApiDeckPortFromJson(json);
}

@freezed
class ApiNDock with _$ApiNDock {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ApiNDock({
    required int apiMemberId,
    required int apiId,
    required int apiState,
    required int apiShipId,
    required int apiCompleteTime,
    required String apiCompleteTimeStr,
    required int apiItem1,
    required int apiItem2,
    required int apiItem3,
    required int apiItem4,
  }) = _ApiNDock;

  factory ApiNDock.fromJson(Map<String, dynamic> json) =>
      _$ApiNDockFromJson(json);
}

@freezed
class ApiShip with _$ApiShip {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ApiShip({
    @Default(0) int? apiId,
    @Default(0) int? apiSortno,
    @Default(0) int? apiShipId,
    @Default(0) int? apiLv,
    @Default(<int>[]) List<int>? apiExp,
    @Default(0) int? apiNowhp,
    @Default(0) int? apiMaxhp,
    @Default(0) int? apiSoku,
    @Default(0) int? apiLeng,
    @Default(<int>[]) List<int>? apiSlot,
    @Default(<int>[]) List<int>? apiOnslot,
    @Default(0) int? apiSlotEx,
    @Default(<int>[]) List<int>? apiKyouka,
    @Default(0) int? apiBacks,
    @Default(0) int? apiFuel,
    @Default(0) int? apiBull,
    @Default(0) int? apiSlotnum,
    @Default(0) int? apiNdockTime,
    @Default(<int>[]) List<int>? apiNdockItem,
    @Default(0) int? apiSrate,
    @Default(0) int? apiCond,
    @Default(<int>[]) List<int>? apiKaryoku,
    @Default(<int>[]) List<int>? apiRaisou,
    @Default(<int>[]) List<int>? apiTaiku,
    @Default(<int>[]) List<int>? apiSoukou,
    @Default(<int>[]) List<int>? apiKaihi,
    @Default(<int>[]) List<int>? apiTaisen,
    @Default(<int>[]) List<int>? apiSakuteki,
    @Default(<int>[]) List<int>? apiLucky,
    @Default(0) int? apiLocked,
    @Default(0) int? apiLockedEquip,
  }) = _ApiShip;

  factory ApiShip.fromJson(Map<String, dynamic> json) =>
      _$ApiShipFromJson(json);
}

@freezed
class ApiBasic with _$ApiBasic {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ApiBasic({
    required String apiMemberId,
    required String apiNickname,
    required String apiNicknameId,
    required int apiActiveFlag,
    @JsonKey(name: 'api_starttime') required int apiStartTime,
    required int apiLevel,
    required int apiRank,
    required int apiExperience,
    @JsonKey(name: 'api_fleetname') String? apiFleetName,
    required String apiComment,
    required String apiCommentId,
    required int apiMaxChara,
    @JsonKey(name: 'api_max_slotitem') required int apiMaxSlotItem,
    required int apiMaxKagu,
    @JsonKey(name: 'api_playtime') required int apiPlayTime,
    required int apiTutorial,
    required List<int> apiFurniture,
    required int apiCountDeck,
    @JsonKey(name: 'api_count_kdock') required int apiCountKDock,
    @JsonKey(name: 'api_count_ndock') required int apiCountNDock,
    @JsonKey(name: 'api_fcoin') required int apiFCoin,
    required int apiStWin,
    required int apiStLose,
    required int apiMsCount,
    required int apiMsSuccess,
    required int apiPtWin,
    required int apiPtLose,
    required int apiPtChallenged,
    required int apiPtChallengedWin,
    @JsonKey(name: 'api_firstflag') required int apiFirstFlag,
    required int apiTutorialProgress,
    required List<int> apiPvp,
    required int apiMedals,
    required int apiLargeDock,
  }) = _ApiBasic;

  factory ApiBasic.fromJson(Map<String, dynamic> json) =>
      _$ApiBasicFromJson(json);
}

@freezed
class ApiLog with _$ApiLog {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ApiLog({
    required int apiNo,
    required String apiType,
    required String apiState,
    required String apiMessage,
  }) = _ApiLog;

  factory ApiLog.fromJson(Map<String, dynamic> json) => _$ApiLogFromJson(json);
}