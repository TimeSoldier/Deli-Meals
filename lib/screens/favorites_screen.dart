import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  static const routeName = '/favorites';
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
      return Center(
        child: Text('No Favorites yet. Start adding some!'),
      );
    } else {
      return ListView.builder(
        itemCount: widget.favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: widget.favoriteMeals[index].id,
            title: widget.favoriteMeals[index].title,
            imageUrl: widget.favoriteMeals[index].imageUrl,
            duration: widget.favoriteMeals[index].duration,
            complexity: widget.favoriteMeals[index].complexity,
            affordability: widget.favoriteMeals[index].affordability,
            removeItem: (String mealId) {
              setState(() {
                widget.favoriteMeals.removeWhere((meal) => meal.id == mealId);
              });
            },
          );
        },
      );
    }
  }
}
