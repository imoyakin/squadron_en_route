// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'api_result.freezed.dart';
// part 'api_result.g.dart';

// @unfreezed
// class KancolleApiResult<T> with _$KancolleApiResult<T> {
//   const factory KancolleApiResult({
//     @JsonKey(name: 'api_result') required int apiResult,
//     @JsonKey(name: 'api_result_msg') required String apiResultMsg,
//     @JsonKey(name: 'api_data') required T apiData,
//   }) = _KancolleApiResult<T>;

//   factory KancolleApiResult.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
//       _$KancolleApiResultFromJson(json, fromJsonT);
// }