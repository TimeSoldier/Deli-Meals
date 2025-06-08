import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildListTile(BuildContext context, String title, IconData icon,
        void Function() tapHandler) {
      return ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        onTap: tapHandler,
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildListTile(
            context,
            "Meals",
            Icons.restaurant,
            () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          _buildListTile(
            context,
            "Settings",
            Icons.settings,
            () => Navigator.of(context)
                .pushReplacementNamed(FiltersScreen.routeName),
          ),
        ],
      ),
    );
  }
}
