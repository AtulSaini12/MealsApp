import 'package:MealsApp/models/meal.dart';
import 'package:MealsApp/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favouriteMeals;
  FavoritesScreen(this._favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (_favouriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favourites yet -- Start adding some!!!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _favouriteMeals[index].id,
            title: _favouriteMeals[index].title,
            imageUrl: _favouriteMeals[index].imageUrl,
            duration: _favouriteMeals[index].duration,
            affordability: _favouriteMeals[index].affordability,
            complexity: _favouriteMeals[index].complexity,
          );
        },
        itemCount: _favouriteMeals.length,
      );
    }
  }
}
