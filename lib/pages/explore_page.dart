import 'package:flutter/material.dart';

import '../widgets/coffee_tile.dart';
import 'product_detail_page.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({Key? key}) : super(key: key);
  final List<String> _categories = ["Cappuccino", "Esspresso", "Latte", "Tea"];
  final List<Map<String, dynamic>> _list = [
    {
      "title": "Cappuccino",
      "subTitle": "with Oat Milk",
      "price": 4.2,
      "ratings": 4.0,
      "imagePath": "assets/images/coffee.jpg",
      "description":
          "In its most popular form, a cappuccino is a hot, frothy drink with a creamy top, milky middle, and full-bodied brew at the bottom. Made with ⅓ espresso, ⅓ steamed milk, and ⅓ frothed milk, this classic espresso drink is delicious. 1. Start with a single shot of espresso of your coffee of choice.",
    },
    {
      "title": "Latte",
      "subTitle": "with Oat Milk",
      "price": 4.8,
      "ratings": 4.3,
      "imagePath": "assets/images/latte.jpg",
      "description":
          "Latte. Espresso + steamed milk + (a little bit of) frothed milk. Served in a tall latte glass. Making up around two-thirds of the drink, the key component of the latte is the milk which needs to be evenly heated and without an excess of foam.",
    },
    {
      "title": "Milk",
      "subTitle": "with Oat Milk",
      "price": 3.0,
      "ratings": 4.0,
      "imagePath": "assets/images/milk.jpg",
      'description':
          "What are the descriptions of milk Image result for milk description for menu Milk is an emulsion or colloid of butterfat globules within a water-based fluid that contains dissolved carbohydrates and protein aggregates with minerals.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, top: 20, bottom: 20),
          child: Text(
            "Find the best \ncoffee for you",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
        ),
        //searchBAr
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueGrey.withOpacity(0.1),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12)),
                prefixIcon: const Icon(Icons.search_rounded),
                hintText: "Find Your Coffee..."),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        //Categories
        SizedBox(
          height: 30,
          child: StatefulBuilder(
            builder: (context, setState) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.only(right: 40, left: index == 0 ? 16 : 0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _categories[index],
                          style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.orange
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        CircleAvatar(
                          radius: 4,
                          backgroundColor: selectedIndex == index
                              ? Colors.orange
                              : Colors.transparent,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        //List of Products
        SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _list.length,
              itemBuilder: (context, index) {
                final myMap = _list[index];
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 16 : 0),
                  // child: CoffeeTile(),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(productMap: myMap),
                        )),
                    child: CoffeeTile(
                        imagePath: myMap["imagePath"],
                        title: myMap["title"],
                        subTitle: myMap["subTitle"],
                        price: myMap["price"],
                        ratings: myMap["ratings"]),
                  ),
                );
              },
            )),
      ],
    );
  }
}
