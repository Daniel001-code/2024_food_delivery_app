import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_current_location.dart';
import 'package:food_delivery_app/components/my_description_box.dart';
import 'package:food_delivery_app/components/my_drawer.dart';
import 'package:food_delivery_app/components/my_food_tile.dart';
import 'package:food_delivery_app/components/my_silver_app_bar.dart';
import 'package:food_delivery_app/components/my_tab_bar.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // sort out and return a list of food items that belong to a specific category

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: categoryMenu.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: ((context, index) {
            // get individual food
            final food = categoryMenu[index];

            // return food tile UI
            return FoodTile(
                food: food,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FoodPage(food: food))));
          }));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  MySilverAppBar(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Divider(
                              indent: 25,
                              endIndent: 25,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            // my current location
                            const MyCurrentLocation(),

                            // description box
                            const MyDescriptionBox(),
                          ],
                        ),
                      ),
                      title: MyTabBar(tabController: _tabController))
                ],
            body: Consumer<Restaurant>(
              builder: (context, restaurant, child) => TabBarView(
                controller: _tabController,
                children: getFoodInThisCategory(restaurant.menu),
              ),
            )),
      ),
    );
  }
}
