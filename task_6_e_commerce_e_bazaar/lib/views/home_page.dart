import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:task_6_e_commerce_e_bazaar/constants/themes.dart';
import 'package:task_6_e_commerce_e_bazaar/controllers/itembag_controller.dart';
import 'package:task_6_e_commerce_e_bazaar/controllers/product_controller.dart';
import 'package:task_6_e_commerce_e_bazaar/views/detail_page.dart';
import 'package:task_6_e_commerce_e_bazaar/views/login_screen.dart';
import 'package:task_6_e_commerce_e_bazaar/widgets/chip_widget.dart';

import '../widgets/ads_banner_widget.dart';
import '../widgets/card_widget.dart';
import 'cart_page.dart';

final currentIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(proudctNotifierProvider);
    final currentIndex = ref.watch(currentIndexProvider);
    final itemBag = ref.watch(itemBagProvider);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: kSecondaryColor,
        title: Text("E-Bazaar", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w600),),
        centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: Badge(
                label: Text(itemBag.length.toString()),
                child: IconButton(
                  color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CardPage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.local_mall,
                      size: 24,
                    )),
              ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: kSecondaryColor,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'E-Bazaar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'Place of your choices',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('\tCategories'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to categories page
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('\tCart'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CardPage(),
                  ),
                );
                },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('\tWishlist'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to wishlist page
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('\tProfile'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to profile page
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('\tLogout'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                // Implement logout functionality
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              // Ads banner section
              const AdsBannerWidget(),
              SizedBox(height: 20,),
              // Chip section
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  // shrinkWrap: true,
                  children: const [
                    ChipWidget(chipLabel: 'All'),
                    ChipWidget(chipLabel: 'Computers'),
                    ChipWidget(chipLabel: 'Headsets'),
                    ChipWidget(chipLabel: 'Accessories'),
                    ChipWidget(chipLabel: 'Printing'),
                    ChipWidget(chipLabel: 'Cameras'),
                  ],
                ),
              ),
              // Hot sales section
              SizedBox(height: 20,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hot Sales', style: AppTheme.kHeadingOne),
                  Text(
                    'See all',
                    style: AppTheme.kSeeAllText,
                  ),
                ],
              ),

              Container(
                padding: const EdgeInsets.all(4),
                width: double.infinity,
                height: 300,
                child: ListView.builder(
                  padding: const EdgeInsets.all(4),
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      ProductCardWidget(productIndex: index),
                ),
              ),
              // Featured products
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Featured Products', style: AppTheme.kHeadingOne),
                  Text(
                    'See all',
                    style: AppTheme.kSeeAllText,
                  ),
                ],
              ),

              MasonryGridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                shrinkWrap: true,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(getIndex: index),
                      )),
                  child: SizedBox(
                    height: 250,
                    child: ProductCardWidget(productIndex: index),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) =>
            ref.read(currentIndexProvider.notifier).update((state) => value),
        selectedItemColor: kSecondaryColor,
        unselectedItemColor: kSecondaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorite',
            activeIcon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'Location',
            activeIcon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notification',
            activeIcon: Icon(Icons.notifications),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}