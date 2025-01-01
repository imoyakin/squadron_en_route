import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'web_message_data.freezed.dart';
part 'web_message_data.g.dart';

@freezed
class WebMessageData with _$WebMessageData {
  const factory WebMessageData({
    required String type,
    @JsonKey(name: "response_url") required String responseUrl,
    String? response,
    @JsonKey(name: "response_type") String? responseType,
    String? request,
    String? method,
    @JsonKey(name: "request_url") required String requestUrl,
    int? status,
  }) = _WebMessageData;

  factory WebMessageData.fromJson(Map<String, dynamic> json) =>
      _$WebMessageDataFromJson(json);
}