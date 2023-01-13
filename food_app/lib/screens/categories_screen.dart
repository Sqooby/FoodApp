import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/categories.dart';
// import '../models/category.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<Categories>(context);
    final categoriesList = categoriesData.items;
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("DeliMeal"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(25),
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => {},
            borderRadius: BorderRadius.circular(15),
            // splashColor: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Text(categoriesList[index].title,
                  style: Theme.of(context).textTheme.headline1),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    categoriesList[index].color.withOpacity(0.7),
                    categoriesList[index].color
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
