import 'package:flutter/material.dart';
import 'package:uebungsapp/pages/menu_page.dart';
import 'package:uebungsapp/pages/rezept_page.dart';
import 'package:uebungsapp/pages/start_page.dart';
import 'package:uebungsapp/pages/recipes_screen.dart';
import 'recipe_list_screen.dart';
// main.dart - ganz oben zu den anderen imports
import 'add_recipe_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
      routes: {
        '/startpage': (context) => StartPage(),
        '/menupage': (context) => MenuPage(),
        '/recipes_screen': (context) => RecipesScreen(),
        '/add_recipe_screen': (context) => AddRecipeScreen(),
        '/recipe_list_screen': (context) => RecipeListScreen(),
      },
    );
  }
}
