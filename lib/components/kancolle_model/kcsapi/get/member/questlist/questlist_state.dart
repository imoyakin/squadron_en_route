part of 'questlist_cubit.dart';

enum QuestState {
  @JsonValue(1)
  unaccepted,
  @JsonValue(2)
  ongoing,
  @JsonValue(3)
  achieved,
}

@Freezed(unionKey: 'questlist_type', unionValueCase: FreezedUnionCase.pascal)
class QuestlistState with _$QuestlistState  implements EquatableMixin{
  const QuestlistState._();
  const factory QuestlistState.initial() = _Initial;

  @JsonSerializable(fieldRename: FieldRename.snake)
  @FreezedUnionValue('loaded')
  const factory QuestlistState.loaded({
    required int apiCount,
    required int apiCompletedKind,
    required List<Quest> apiList, //fixit
    required int apiExecCount,
    required List<ApiClist> apiCList, //fixit
    required int apiExecType,
  }) = _Loaded;

  factory QuestlistState.fromJson(Map<String, dynamic> json) =>
      _$QuestlistStateFromJson(json);

  @override
  List<Object?> get props => [if(this is _Loaded) (this as _Loaded)];

  @override
  bool? get stringify => true;
}

@freezed
class Quest with _$Quest {
  const factory Quest({
    @JsonKey(name: 'api_no') required int apiNo,
    @JsonKey(name: 'api_category') required int apiCategory,
    @JsonKey(name: 'api_type') required int apiType,
    @JsonKey(name: 'api_label_type') required int apiLabelType,
    @JsonKey(name: 'api_state') required QuestState apiState,
    @JsonKey(name: 'api_title') required String apiTitle,
    @JsonKey(name: 'api_detail') required String apiDetail,
    @JsonKey(name: 'api_voice_id') required int apiVoicedId,
    @JsonKey(name: 'api_get_material') required List<int> apiGetMaterial,
    @JsonKey(name: 'api_bonus_flag') required int apiBonusFlag,
    @JsonKey(name: 'api_progress_flag') required int apiProgressFlag,
    @JsonKey(name: 'api_invalid_flag') required int apiInvalidFlag,
  }) = _Quest;

  factory Quest.fromJson(Map<String, dynamic> json) => _$QuestFromJson(json);
}

@freezed
class ApiClist with _$ApiClist {
  const factory ApiClist({
    @JsonKey(name: "api_no") required int apiNo,
    @JsonKey(name: "api_state") required int apiState,
    @JsonKey(name: "api_progress_flag") required int apiProgressFlag,
    @JsonKey(name: "api_c_flag") required int apiPage,
  }) = _ApiClist;

  factory ApiClist.fromJson(Map<String, dynamic> json) =>
      _$ApiClistFromJson(json);
}
