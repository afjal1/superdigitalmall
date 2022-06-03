import 'model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<Products>> fetchProducts() async {
    var response = await client.get(
        Uri.parse("https://fakestoreapi.com/products"),
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productsFromJson(jsonString);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
