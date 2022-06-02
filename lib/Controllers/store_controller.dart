import 'package:get/get.dart';

import '../widgets/product_card.dart';

class StoreController extends GetxController {
  List<int> favProducts = [];

  int sectionIndex = 0;

  setSection({required int kValue}) {
    sectionIndex = kValue;
    update();
  }

  addToLiked({required int id}) {
    if (favProducts.contains(id)) {
      favProducts.remove(id);
    } else {
      favProducts.add(id);
    }
    update();
  }

  List<Product> myProducts = const [
    Product(
        id: 5,
        image:
            "https://scontent.fdel6-1.fna.fbcdn.net/v/t1.6435-9/120259938_3977210398960850_5559171442244667313_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=PC3Dg6BC3skAX91yWOx&_nc_ht=scontent.fdel6-1.fna&oh=00_AT8Oe6nYIBUdjrCY-d_9Yf3P4BIX2bm0cjPOXiFxKbhBuQ&oe=62B7B6E4",
        price: 70,
        title: "Product1"),
    Product(
        image:
            "https://scontent.fdel6-1.fna.fbcdn.net/v/t1.6435-9/120259938_3977210398960850_5559171442244667313_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=PC3Dg6BC3skAX91yWOx&_nc_ht=scontent.fdel6-1.fna&oh=00_AT8Oe6nYIBUdjrCY-d_9Yf3P4BIX2bm0cjPOXiFxKbhBuQ&oe=62B7B6E4",
        id: 6,
        price: 100,
        title: "Product2"),
    Product(
        image:
            "https://scontent.fdel6-1.fna.fbcdn.net/v/t1.6435-9/120259938_3977210398960850_5559171442244667313_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=PC3Dg6BC3skAX91yWOx&_nc_ht=scontent.fdel6-1.fna&oh=00_AT8Oe6nYIBUdjrCY-d_9Yf3P4BIX2bm0cjPOXiFxKbhBuQ&oe=62B7B6E4",
        id: 7,
        price: 30,
        title: "Product3"),
    Product(
        image:
            "https://scontent.fdel6-1.fna.fbcdn.net/v/t1.6435-9/120259938_3977210398960850_5559171442244667313_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=PC3Dg6BC3skAX91yWOx&_nc_ht=scontent.fdel6-1.fna&oh=00_AT8Oe6nYIBUdjrCY-d_9Yf3P4BIX2bm0cjPOXiFxKbhBuQ&oe=62B7B6E4",
        id: 8,
        price: 45,
        title: "Product14"),
  ];
  List<Product> shirts = const [
    Product(
        id: 1,
        image:
            "https://scontent.fdel6-1.fna.fbcdn.net/v/t1.6435-9/120259938_3977210398960850_5559171442244667313_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=PC3Dg6BC3skAX91yWOx&_nc_ht=scontent.fdel6-1.fna&oh=00_AT8Oe6nYIBUdjrCY-d_9Yf3P4BIX2bm0cjPOXiFxKbhBuQ&oe=62B7B6E4",
        price: 70,
        title: "Product11"),
    Product(
        id: 2,
        image:
            "https://scontent.fdel6-1.fna.fbcdn.net/v/t1.6435-9/120217203_3977210248960865_7201215298107640967_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=3z01nMkZpuwAX-0pdcJ&_nc_ht=scontent.fdel6-1.fna&oh=00_AT_G5Q7AmvhNlJir93nqFB421lLxY9Aw7oPACfNZ0yNAYg&oe=62B7981E",
        price: 100,
        title: "Product12"),
    Product(
        id: 3,
        image:
            "https://scontent.fdel6-1.fna.fbcdn.net/v/t1.6435-9/120217203_3977210248960865_7201215298107640967_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=3z01nMkZpuwAX-0pdcJ&_nc_ht=scontent.fdel6-1.fna&oh=00_AT_G5Q7AmvhNlJir93nqFB421lLxY9Aw7oPACfNZ0yNAYg&oe=62B7981E",
        price: 70,
        title: "Product13"),
    Product(
        id: 4,
        image:
            "https://external.fdel6-1.fna.fbcdn.net/safe_image.php?w=500&h=261&url=https%3A%2F%2Fimages-eu.ssl-images-amazon.com%2Fimages%2FI%2F51OwZITIOqL._SR600%252c315_PIWhiteStrip%252cBottomLeft%252c0%252c35_PIStarRatingFOURANDHALF%252cBottomLeft%252c360%252c-6_SR600%252c315_ZA%285542%2520Reviews%29%252c445%252c291%252c400%252c400%252carial%252c12%252c4%252c0%252c0%252c5_SCLZZZZZZZ_.jpg&cfs=1&ext=jpg&utld=ssl-images-amazon.com&_nc_oe=702f5&_nc_sid=505865&_nc_o2e=1&ccb=3-6&_nc_hash=AQEa3oGsG97U8RO0",
        price: 70,
        title: "Product14"),
  ];

  List<String> sections = const [
    "All",
    "Shirts",
    "Shoes",
    "Technology",
  ];

  // List<Product> products = wproducts + tproducts;
}
