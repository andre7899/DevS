import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main(List<String> arguments) async {
  var url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': 'http'});
  print(url);

  var response = await http.get(url);
  //codigo 200 es que todo ha ido bien
  if (response.statusCode == 200) {
    // print(response.body);
    var dataJSON = convert.jsonDecode(response.body);
    var totalItems = dataJSON['totalItems'];
    print('El numero total de resultados es de $totalItems');

    for (var item in dataJSON['items']) {
      print(item['volumeInfo']['title']);
    }
  }
}
