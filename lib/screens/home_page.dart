import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/store_controller.dart';
import '../widgets/bottomItem.dart';
import '../widgets/custom_animated_bottombar.dart';
import '../widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  static const _inactiveColor = Colors.grey;

  Widget _buildBottomBar() {
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.white,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) {
        setState(() => _currentIndex = index);
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.home),
          title: const Text('Home'),
          activeColor: Colors.red,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.shopping_bag),
          title: const Text('Cart'),
          activeColor: Colors.red,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.favorite),
          title: const Text(
            'Favorite',
          ),
          activeColor: Colors.red,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.person),
          title: const Text('Profile'),
          activeColor: Colors.red,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Home",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Users",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Messages",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Settings",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Product> tproducts = const [
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
    List<Product> wproducts = const [
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
              "https://scontent.fdel6-1.fna.fbcdn.net/v/t45.5328-4/40483663_1844080555641544_6972739719834632192_n.jpg?stp=dst-jpg_s960x960&_nc_cat=104&ccb=1-7&_nc_sid=c48759&_nc_ohc=UQOmsEpKAcwAX82F_X4&_nc_ht=scontent.fdel6-1.fna&oh=00_AT9tm58PaW244W_cCTHxsAHEFYECIPx3lL8qWJfuOft5Cw&oe=6297C4C9",
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

    List<Product> products = wproducts + tproducts;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<StoreController>(
              init: StoreController(),
              builder: (storeController) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        const Text(
                          "Super Digital Mall",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.search,
                          size: 35,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Stack(
                          children: [
                            const Icon(
                              Icons.shopping_cart,
                              size: 35,
                            ),
                            Positioned(
                              right: -2,
                              top: 0,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://scontent.fdel6-1.fna.fbcdn.net/v/t1.6435-9/90330179_3404838302864732_366306323177930752_n.jpg?stp=dst-jpg_s960x960&_nc_cat=111&ccb=1-7&_nc_sid=e3f864&_nc_ohc=K5IHmlXNEXwAX9SGuTR&_nc_ht=scontent.fdel6-1.fna&oh=00_AT_ORyLgZbE6aRYHDFhiffd1h67g64GkuTP5tpaBaSLpZg&oe=62BA4077"),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: sections.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              storeController.setSection(kValue: index);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                width: 100,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25)),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      sections[index],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: storeController.sectionIndex ==
                                                  index
                                              ? Colors.red
                                              : Colors.black),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: index ==
                                                  storeController.sectionIndex
                                              ? Colors.red
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      width: 20,
                                      height: 5,
                                    )
                                  ],
                                )),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.6, crossAxisCount: 2),
                      shrinkWrap: true,
                      itemCount: storeController.sectionIndex == 0
                          ? products.length
                          : tproducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductBlock(
                            product: storeController.sectionIndex == 0
                                ? products[index]
                                : tproducts[index]);
                      },
                    ),
                  ],
                );
              }),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }
}
