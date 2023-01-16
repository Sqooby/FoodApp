import 'package:flutter/material.dart';

import 'package:food_app/providers/meals.dart';
import 'package:provider/provider.dart';
import './providers/categories.dart';

import './screens/categories_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/categories_meal_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List<Meal> _availableMeal = Provider.of<Meals>(context);
  // List<Meal> _favoriteMeals = [];

  // Map<String, bool> _filters = {
  //   'gluten': false,
  //   'lactose': false,
  //   'vegan': false,
  //   'vegeterian': false,
  // };

  // void _setFilters(Map<String, bool> filterData) {
  //   setState(() {
  //     _filters = filterData;
  //     _availableMeal = DUMMY_MEALS.where((meal) {
  //       if (_filters['gluten'] == true && !meal.isGlutenFree) {
  //         return false;
  //       }
  //       if (_filters['lactose'] == true && !meal.isLactoseFree) {
  //         return false;
  //       }
  //       if (_filters['vegan'] == true && !meal.isVegan) {
  //         return false;
  //       }
  //       if (_filters['vegeterian'] == true && !meal.isVegetarian) {
  //         return false;
  //       }
  //       return true;
  //     }).toList();
  //   });
  // }

  // void _toggleFavorite(String mealId) {
  //   final existingIndex =
  //       _favoriteMeals.indexWhere((meal) => meal.id == mealId);
  //   if (existingIndex >= 0) {
  //     setState(() {
  //       _favoriteMeals.removeAt(existingIndex);
  //     });
  //   } else {
  //     setState(() {
  //       _favoriteMeals.add(
  //         DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
  //       );
  //     });
  //   }
  // }

  // bool _isMealFavorite(String id) {
  //   return _favoriteMeals.any((meal) => meal.id == id);
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Meals(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Categories(),
        ),
      ],
      child: MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              )),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber),
        ),
        home: CategoriesScreen(),
        routes: {
          // '/': (ctx) => TabsScreen(_favoriteMeals),
          CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen()
          // FilterScreen.RouteName: (ctx) => FilterScreen(),
        },
      ),
    );
  }
}
