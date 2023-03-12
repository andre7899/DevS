import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_get_request/helpers/base_request.dart';
import 'package:http_get_request/models/item.dart';

const url = 'https://jsonplaceholder.typicode.com/posts/10';

class RequestItem implements HTTPRequest<Item> {
  final String url;

  RequestItem({required this.url});

  @override
  Future<Item> execute() async {
    // TODO: implement execute
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw http.ClientException('Error con los datos');
    }
    return _parseJSON(response.body);
  }

  Item _parseJSON(String response) {
    return Item.fromJson(jsonDecode(response));
  }
}
