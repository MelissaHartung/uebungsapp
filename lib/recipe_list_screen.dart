// lib/recipe_list_screen.dart
import 'package:flutter/material.dart';
import 'package:uebungsapp/components/event-tile.dart';
import 'package:uebungsapp/pages/rezept_page.dart';
import 'database_helper.dart';
import 'rezept.dart';
import 'add_recipe_screen.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List<Recipe> _recipes = [];

  @override
  void initState() {
    super.initState();
    _loadRecipes(); // Rezepte beim Start laden
  }

  // Alle Rezepte aus der Datenbank laden
  void _loadRecipes() async {
    final recipes = await DatabaseHelper().getAllRecipes();
    setState(() {
      _recipes = recipes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 120, 156, 122),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 87, 37),
        title: Text(
          'Meine Rezepte',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: _recipes.isEmpty
          ? Center(
              child: Text(
                'Noch keine Rezepte vorhanden.\nFüge dein erstes Rezept hinzu!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            )
          : GridView.builder(
              shrinkWrap: true,
              itemCount: _recipes.length,
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (BuildContext context, int index) {
                final recipe = _recipes[index];
                return EventTile(
                  name: recipe.title,
                  category: recipe.category,
                  imagePath: 'lib/images/spiegelei.png', // Platzhalterbild
                  details: () {
                    _showRecipeDetails(recipe);
                  },
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddRecipeScreen()),
          ).then((_) {
            // Nach dem Hinzufügen die Liste neu laden
            _loadRecipes();
          });
        },
        child: Icon(Icons.add),
        tooltip: 'Rezept hinzufügen',
      ),
    );
  }

  void _showRecipeDetails(Recipe recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RezeptPage(recipe: recipe)),
    );
  }

  // // Rezept-Details anzeigen
  // void _showRecipeDetails(Recipe recipe) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(recipe.title),
  //         content: SingleChildScrollView(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Text(
  //                 'Kategorie: ${recipe.category}',
  //                 style: TextStyle(fontWeight: FontWeight.bold),
  //               ),
  //               SizedBox(height: 10),
  //               Text('Zutaten:', style: TextStyle(fontWeight: FontWeight.bold)),
  //               Text(recipe.ingredients),
  //               SizedBox(height: 10),
  //               Text(
  //                 'Zubereitung:',
  //                 style: TextStyle(fontWeight: FontWeight.bold),
  //               ),
  //               Text(recipe.instructions),
  //             ],
  //           ),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.of(context).pop(),
  //             child: Text('Schließen'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
