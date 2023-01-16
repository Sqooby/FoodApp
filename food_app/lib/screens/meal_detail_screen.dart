import 'package:flutter/material.dart';
import 'package:food_app/providers/meals.dart';

import 'package:provider/provider.dart';

import '../providers/meals.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  // final Function toggleFavorite;
  // final Function isFavorite;

  // MealDetailScreen(
  //   this.toggleFavorite,
  //   this.isFavorite,
  // );

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget BuildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealData = Provider.of<Meals>(context);
    final mealDetail = mealData.items;
    final mealId = ModalRoute.of(context)?.settings.arguments;
    final selectedMeal =
        mealDetail.firstWhere((element) => element.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 300,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          buildSectionTitle('Ingredients', context),
          BuildContainer(
            ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(selectedMeal.ingredients[index]),
                ),
              ),
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
          buildSectionTitle("Steps", context),
          BuildContainer(
            ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider(),
                ],
              ),
              itemCount: selectedMeal.steps.length,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print(1);
              mealData.addProduct(selectedMeal);
              print(2);
            },
            child: Text("chuj"),
          ),
        ]),
      ),
    );
  }
}
