import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:squadron_en_route/components/kancolle_model/kancolle_model.dart';

void main() {
  test('Start2GetDataState fromJson', () {
    final file = File('test/kancolle/kcsapi/getData.json');
    final contents = file.readAsStringSync();
    final json = jsonDecode(contents);

    json['api_data']['start2_get_data_state_type'] = 'loaded';
    final state = Start2GetDataState.fromJson(json['api_data']);

    expect(state, isNotNull);
  });
}
