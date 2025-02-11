import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class KancolleItem with _$KancolleItem {
  const factory KancolleItem({
    @Default(0) @JsonKey(name: "api_id") int id,
    @Default("") @JsonKey(name: "api_name") String name,
  }) = _KancolleItem;

  factory KancolleItem.fromJson(Map<String, dynamic> json) =>
      _$KancolleItemFromJson(json);
}
