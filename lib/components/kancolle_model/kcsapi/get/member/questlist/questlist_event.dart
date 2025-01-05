part of 'questlist_bloc.dart';

@freezed
class QuestlistEvent with _$QuestlistEvent {
  const factory QuestlistEvent.init() = _EventInitial;
  const factory QuestlistEvent.update(String data) = _EventUpdate;
  const factory QuestlistEvent.sort(SortOrder sort) = _EventSort;
}