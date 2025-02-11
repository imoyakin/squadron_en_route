import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../webview/webview.dart';
import 'kancolle_model.dart';

void kancolleMessageHandle(BuildContext context, WebMessage message) {
  var json = jsonDecode(message.data);
  var messageData = WebMessageData.fromJson(json);
  // var messageData = WebMessageData.fromJson(json);

  if (messageData.requestUrl.contains("/kcsapi/") &&
      messageData.type == "load") {
    String result = messageData.response!.replaceAll('svdata=', '');
    List<String> seg = Uri.parse(messageData.requestUrl).pathSegments;
    switch (seg[1]) {
      case 'api_start2':
        switch (seg[2]) {
          case 'getData':
            context.read<Start2GetDataCubit>().parse(result);
          default:
            handleDefault(message.data);
        }
      case 'api_port':
        switch (seg[2]) {
          case 'port':
            context.read<KancollePortCubit>().parse(result);
          default:
            handleDefault(message.data);
        }
      case 'api_get_member':
        switch (seg[2]) {
          case 'questlist':
            context.read<QuestlistBloc>().add(QuestlistEvent.update(result));
          // case 'require_info':
          //   //TODO
          //   break;
          case 'ndock':
            context.read<NdockCubit>().parse(result);
          default:
            handleDefault(message.data);
        }
      case 'api_req_member':
        switch (seg[2]) {
          // case 'get_incentive':
          //   break;
          default:
            handleDefault(message.data);
        }
      case 'api_req_kaisou':
        switch (seg[2]) {
          // case 'can_preset_slot_select':
          //   break;
          default:
            handleDefault(message.data);
        }
      case 'api_req_map':
        switch (seg[2]) {
          case 'next':
            context.read<MapNextCubit>().parse(result);
          default:
            handleDefault(message.data);
        }
      case 'api_req_practice':
        switch (seg[2]) {
          case 'battle_result':
            context.read<PracticeBattleResultCubit>().parse(result);
          default:
            handleDefault(message.data);
        }
      case 'api_req_quest':
        switch (seg[2]) {
          case 'clearitemget':
            context.read<ClearitemgetCubit>().parse(result);
          default:
            handleDefault(message.data);
        }
      default:
        handleDefault(message.data);
    }
  }
}

void handleDefault(dynamic value) {
  print("KancolleMessageHandle: $value");
}
