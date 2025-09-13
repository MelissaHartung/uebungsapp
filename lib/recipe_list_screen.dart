// lib/recipe_list_screen.dart
import 'package:flutter/material.dart';
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
      appBar: AppBar(title: Text('Meine Rezepte')),
      body: _recipes.isEmpty
          ? Center(
              child: Text(
                'Noch keine Rezepte vorhanden.\nFüge dein erstes Rezept hinzu!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                final recipe = _recipes[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      recipe.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Kategorie: ${recipe.category}'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Hier zeigen wir das Rezept im Detail an
                      _showRecipeDetails(recipe);
                    },
                  ),
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

  // Rezept-Details anzeigen
  void _showRecipeDetails(Recipe recipe) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(recipe.title),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Kategorie: ${recipe.category}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('Zutaten:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(recipe.ingredients),
                SizedBox(height: 10),
                Text(
                  'Zubereitung:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(recipe.instructions),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Schließen'),
            ),
          ],
        );
      },
    );
  }
}
