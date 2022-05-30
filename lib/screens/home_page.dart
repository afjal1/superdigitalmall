import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/store_controller.dart';
import '../widgets/bottomItem.dart';
import '../widgets/custom_animated_bottombar.dart';
import '../widgets/product_card.dart';
import 'cart.dart';
import 'profile.dart';

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
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.shopping_bag),
          title: const Text('Cart'),
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.favorite),
          title: const Text(
            'Favorite',
          ),
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.person),
          title: const Text('Profile'),
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      const Demo(),
      MyCart(),
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Messages",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      MyProfile(),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              "Super Digital Mall",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            const Spacer(),
            const Icon(
              Icons.search,
              size: 35,
              color: Colors.black,
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                _currentIndex = 1;
                setState(() {});
              },
              child: Stack(
                children: [
                  const Icon(
                    Icons.shopping_cart,
                    size: 35,
                    color: Colors.black,
                  ),
                  Positioned(
                    right: -2,
                    top: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
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
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
      body: getBody(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }
}

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    const SizedBox(
                      height: 10,
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
                        itemCount: storeController.sections.length,
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
                                      storeController.sections[index],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: storeController.sectionIndex ==
                                                  index
                                              ? Theme.of(context).primaryColor
                                              : Colors.black),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: index ==
                                                  storeController.sectionIndex
                                              ? Theme.of(context).primaryColor
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
                          ? storeController.wproducts.length
                          : storeController.tproducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductCard(
                            product: storeController.sectionIndex == 0
                                ? storeController.wproducts[index]
                                : storeController.tproducts[index]);
                      },
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
