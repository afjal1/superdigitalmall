import 'package:get/get.dart';

class StoreController extends GetxController {
  List<int> likedProducts = [];

  int sectionIndex = 0;

  setSection({required int kValue}) {
    sectionIndex = kValue;
    update();
  }

  addToLiked({required int id}) {
    if (likedProducts.contains(id)) {
      likedProducts.remove(id);
    } else {
      likedProducts.add(id);
    }
    update();
  }
}
