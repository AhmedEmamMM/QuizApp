import 'package:flutter/material.dart';

extension ExtNumber on num {
  get verticalSpace => SizedBox(height: toDouble());
  get horizontalSpace => SizedBox(width: toDouble());
}

extension Navigation on BuildContext {
  Future<dynamic> navigateTo(Widget pageName) {
    return Navigator.of(this).push(MaterialPageRoute(
      builder: (context) => pageName,
    ));
  }

  Future<dynamic> navigatoAndRemoveAll(Widget pageName) {
    return Navigator.of(this).pushReplacement(MaterialPageRoute(
      builder: (context) => pageName,
    ));
  }

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

SizedBox verticalSpace(double height) => SizedBox(height: height);
SizedBox horizontalSpace(double width) => SizedBox(width: width);

double widthOfTheScreen(BuildContext context) =>
    MediaQuery.of(context).size.width;
double heightOfTheScreen(BuildContext context) =>
    MediaQuery.of(context).size.height;

//format aouble calue into money
String makeDoubleToMoneyToString(double price) => price.toStringAsFixed(2);

// format list of addons into a string summary
  // String formatAddons(List<Addon> addons) {
  //   return addons
  //       .map((addon) => "${addon.name} (${formatPrice(addon.price)})")
  //       .join(", ");
  // }


// //sort out and return a list of food items that belong to a specific category
//   List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
//     return fullMenu.where((food) => food.category == category).toList();
//   }

// return list of foods in givin category
// List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
//     return FoodCategory.values.map((category) {
//       // get category menu
//       List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

//       return ListView.builder(
//           itemCount: categoryMenu.length,
//           physics: const NeverScrollableScrollPhysics(),
//           padding: EdgeInsets.zero,
//           itemBuilder: (context, index) {
//             // get individal food
//             final food = categoryMenu[index];

//             //return food tile UI
//             return FoodTile(
//                 food: food,
//                 onTap: () => Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => FoodPage(food: food)))).animate().fadeIn(duration: 1500.ms, delay: 600.ms).shake().scaleXY();
//           });
//     }).toList();
//   }