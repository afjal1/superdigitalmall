import 'package:get/get.dart';
import 'package:superdigitalmall/ApiHelper/model.dart';

import '../ApiHelper/api_helper.dart';

class StoreController extends GetxController {
  List<int> favProducts = [];
  List<int> cartProducts = [];

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int sectionIndex = 0;

  List<String>? sectionss = [
    "All",
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing"
  ];

  List<Products>? _productss;
  List<Products> get products => _productss!;

  //cart

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void getProducts() async {
    _isLoading = true;
    _productss = [];
    try {
      var products = await RemoteServices.fetchProducts();
      _productss!.addAll(products);
      _isLoading = false;
      update();
    } finally {
      _isLoading = false;
      update();
    }
  }

  List<Products>? _categoryProducts;
  List<Products> get categoryProducts => _categoryProducts!;

  setSection({required int kValue, required String kSection}) {
    sectionIndex = kValue;

    _categoryProducts =
        _productss!.where((product) => product.category == kSection).toList();

    update();
  }

  addToLiked({required Products products}) {
    if (favProducts.contains(products.id)) {
      favProducts.remove(products.id);

      update();
    } else {
      favProducts.add(products.id!);

      update();
    }
  }

  addToCart({required Products products}) {
    if (cartProducts.contains(products.id)) {
      cartProducts.remove(products.id);

      update();
    } else {
      cartProducts.add(products.id!);

      update();
    }
  }

  int _cartCount = 0;
  int get cartCount => _cartCount;

  getCartCount() {
    _cartCount = cartProducts.length;
    update();
  }

  double get cartTotal => cartProducts.fold(0, (total, id) {
        return total +
            double.parse(_productss!
                .firstWhere((product) => product.id == id)
                .price
                .toString());
      });
}
