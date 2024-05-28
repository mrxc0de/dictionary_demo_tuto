import 'dart:convert';

import 'package:dictionary_demo_tuto/dict_model.dart';
import 'package:http/http.dart' as http;

class API {
  static const String baseUrl =
      'https://api.dictionaryapi.dev/api/v2/entries/en/';

  static Future<DictModel> fetchMeaning(String word) async {
    final response = await http.get(Uri.parse(baseUrl + word));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      DictModel dictModel = DictModel.fromJson(data[0]);
      return dictModel;
    } else {
      throw Error();
      print('Fetching Error');
    }
  }
}
