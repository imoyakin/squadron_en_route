part of 'questlist_bloc.dart';

enum QuestState {
  @JsonValue(1)
  unaccepted,
  @JsonValue(2)
  ongoing,
  @JsonValue(3)
  achieved,
}

enum SortOrder {
  noSort,
  ongoingAsc,
  ongoingDesc,
  typeAsc,
  typeDesc,
}

@freezed
class QuestlistState with _$QuestlistState implements EquatableMixin {
  const QuestlistState._();
  const factory QuestlistState.initial() = _Initial;

  @JsonSerializable(fieldRename: FieldRename.snake)
  @FreezedUnionValue('loaded')
  const factory QuestlistState.loaded({
    required QuestlistStateData apiData,
    @Default(SortOrder.noSort) SortOrder? sortOrder,
  }) = _Loaded;

  factory QuestlistState.fromJson(Map<String, dynamic> json) =>
      _$QuestlistStateFromJson(json);

  @override
  List<Object?> get props => [if (this is _Loaded) (this as _Loaded)];

  @override
  bool? get stringify => true;
}

@Freezed(
  unionKey: 'questlist_type',
  unionValueCase: FreezedUnionCase.pascal,
  copyWith: true,
  makeCollectionsUnmodifiable: false,
  equal: false,
)
class QuestlistStateData with _$QuestlistStateData implements EquatableMixin {
  const QuestlistStateData._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  @FreezedUnionValue('loaded')
  const factory QuestlistStateData.loaded({
    required int apiCount,
    required int apiCompletedKind,
    required List<Quest> apiList, //fixit
    required int apiExecCount,
    // required List<ApiClist> apiCList, //fixit
    required int apiExecType,
  }) = _StateLoaded;

  factory QuestlistStateData.fromJson(Map<String, dynamic> json) =>
      _$QuestlistStateDataFromJson(json);

  @override
  List<Object?> get props => [if (this is _StateLoaded) (this as _StateLoaded)];

  @override
  bool? get stringify => true;
}

@freezed
sealed class QuestCycleInfo with _$QuestCycleInfo {
  const factory QuestCycleInfo.daily() = _DailyCycleInfo;
  const factory QuestCycleInfo.weekly() = _WeeklyCycleInfo;
  const factory QuestCycleInfo.monthly() = _MonthlyCycleInfo;
  const factory QuestCycleInfo.oneTime() = _OneTimeCycleInfo;
  const factory QuestCycleInfo.quarterly() = _QuarterlyCycleInfo;
  const factory QuestCycleInfo.yearly({required int month}) = _YearlyCycleInfo; // Carries month data
  const factory QuestCycleInfo.other() = _OtherCycleInfo;
  const factory QuestCycleInfo.unknown() = _UnknownCycleInfo;
}

extension QuestCycleInfoLocalization on QuestCycleInfo {
  String localizedName(BuildContext context) {
    // AppLocalizations.of(context) 是 Flutter 标准国际化获取本地化字符串的方式
    // 你可能需要根据你的项目配置调整 (例如，使用 EasyLocalization, Slang 等)
    final l10n = AppLocalizations.of(context)!;

    return when(
      daily: () => l10n.questCycleDaily,
      weekly: () => l10n.questCycleWeekly,
      monthly: () => l10n.questCycleMonthly,
      oneTime: () => l10n.questCycleOneTime,
      quarterly: () => l10n.questCycleQuarterly,
      yearly: (int month) {
        // 方案 1: 使用带参数的字符串 (假设你的 l10n.questCycleYearly 是一个方法或接受参数的getter)
        // return l10n.questCycleYearly(month); 
        // 例如，如果 ARB 是 "questCycleYearly": "Yearly (Month: {month})"
        // 并且 AppLocalizations 生成了 String questCycleYearly(int month) => ...

        // 方案 2: 使用特定月份的键 (更推荐，如果需要显示月份名称)
        switch (month) {
          case 1: return l10n.questCycleYearlyJanuary;
          case 2: return l10n.questCycleYearlyFebruary;
          case 3: return l10n.questCycleYearlyMarch;
          case 4: return l10n.questCycleYearlyApril;
          case 5: return l10n.questCycleYearlyMay;
          case 6: return l10n.questCycleYearlyJune;
          case 7: return l10n.questCycleYearlyJuly;
          case 8: return l10n.questCycleYearlyAugust;
          case 9: return l10n.questCycleYearlySeptember;
          case 10: return l10n.questCycleYearlyOctober;
          case 11: return l10n.questCycleYearlyNovember;
          case 12: return l10n.questCycleYearlyDecember;
          default:
            // 回退到带参数的字符串或通用年度字符串
            return l10n.questCycleYearly(month.toString()); // 确保 l10n.questCycleYearly 能处理这种情况
        }
      },
      other: () => l10n.questCycleOther,
      unknown: () => l10n.questCycleUnknown,
    );
  }
}

@freezed
class Quest with _$Quest {
  const Quest._();
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

  QuestCycleInfo get cycleInfo { // Renamed from cycleType for clarity
    switch (apiType) {
      case 1:
        return const QuestCycleInfo.daily();
      case 2:
        return const QuestCycleInfo.weekly();
      case 3:
        return const QuestCycleInfo.monthly();
      case 4:
        return const QuestCycleInfo.oneTime();
      case 5:
        // api_type 5 is "他(輸送5と空母3,クォータリー/イヤーリー)"
        if (apiLabelType == 7) { // クォータリー (Quarterly)
          return const QuestCycleInfo.quarterly();
        } else if (apiLabelType >= 101 && apiLabelType <= 112) { // Yearly quests (100 + month_number)
          final month = apiLabelType - 100;
          return QuestCycleInfo.yearly(month: month);
        } else {
          // If api_type is 5 but api_label_type doesn't match known quarterly or yearly,
          // it's some other specific periodic task.
          return const QuestCycleInfo.other();
        }
      default:
        return const QuestCycleInfo.unknown();
    }
  }
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
