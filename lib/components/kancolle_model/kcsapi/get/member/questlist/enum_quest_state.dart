import 'package:freezed_annotation/freezed_annotation.dart';

// 状態　1=未受領, 2=遂行中, 3=達成
enum QuestState {
  @JsonValue(1)
  unaccepted,
  @JsonValue(2)
  ongoing,
  @JsonValue(3)
  achieved,
}