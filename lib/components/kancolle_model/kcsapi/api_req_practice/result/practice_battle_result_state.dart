part of 'practice_battle_result_cubit.dart';

@Freezed(
    unionKey: 'practice_battle_result_state_type',
    unionValueCase: FreezedUnionCase.pascal)
class PracticeBattleResultState with _$PracticeBattleResultState {
  const factory PracticeBattleResultState.initial() = _Initial;

  @JsonSerializable(fieldRename: FieldRename.snake)
  @FreezedUnionValue('loaded')
  const factory PracticeBattleResultState.loaded({
    @Default([]) @JsonKey(name: 'api_ship_id') List<int>? shipId,
    @Default('') @JsonKey(name: 'api_win_rank') String? winRank,
    @Default(0) @JsonKey(name: 'api_get_exp') int? getExp,
    @Default(0) @JsonKey(name: 'api_member_lv') int? memberLv,
    @Default(0) @JsonKey(name: 'api_member_exp') int? memberExp,
    @Default(0) @JsonKey(name: 'api_get_base_exp') int? getBaseExp,
    @Default(0) @JsonKey(name: 'api_mvp') int? mvp,
    @Default([]) @JsonKey(name: 'api_get_ship_exp') List<int>? getShipExp,
    @Default([[]])
    @JsonKey(name: 'api_get_exp_lvup')
    List<List<int>>? getExpLvup,
    @Default(null) @JsonKey(name: 'api_enemy_info') PracticeEnemyInfo? enemyInfo,
  }) = _Loaded;

  factory PracticeBattleResultState.fromJson(Map<String, dynamic> json) =>
      _$PracticeBattleResultStateFromJson(json);
}

@freezed
class PracticeEnemyInfo with _$PracticeEnemyInfo {
  const factory PracticeEnemyInfo({
    @Default('') @JsonKey(name: 'api_user_name') String? userName,
    @Default(0) @JsonKey(name: 'api_level') int? level,
    @Default('') @JsonKey(name: 'api_rank') String? rank,
    @Default('') @JsonKey(name: 'api_deck_name') String? deckName,
  }) = _PracticeEnemyInfo;

  factory PracticeEnemyInfo.fromJson(Map<String, dynamic> json) =>
      _$PracticeEnemyInfoFromJson(json);
}
