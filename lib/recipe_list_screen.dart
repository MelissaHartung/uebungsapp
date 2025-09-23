// lib/recipe_list_screen.dart
import 'package:flutter/material.dart';
import 'package:path/path.dart';
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
  List <Recipe> _filteredRecipes = [];

void _filterRecipes() {
  final query = _searchController.text.toLowerCase();
  final filtered = _recipes.where((recipe) {
    final title = recipe.title.toLowerCase();
    final category = recipe.category.toLowerCase();
    return title.contains(query) || category.contains(query);
  }).toList();
  setState(() {
    _filteredRecipes = filtered;
  });
}

  final TextEditingController _searchController = TextEditingController();



  void _showOptionsDialog(Recipe recipe) {
    showDialog(
      context: this.context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Optionen'),
        content: Text('Was möchten Sie mit dem Rezept "${recipe.title}" tun?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Hier können Sie die Bearbeitungsfunktionalität hinzufügen
            },
            child: Text('Bearbeiten'),
          ),
          TextButton(
            onPressed: () async {
              await DatabaseHelper().deleteRecipe(recipe.id!);
              Navigator.of(context).pop();
              _loadRecipes(); // Liste nach dem Löschen aktualisieren
            },
            child: Text('Löschen', style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Abbrechen'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadRecipes();
    _searchController.addListener(_filterRecipes); // Rezepte beim Start laden
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }



  // Alle Rezepte aus der Datenbank laden
  void _loadRecipes() async {
    final recipes = await DatabaseHelper().getAllRecipes();
    setState(() {
      _recipes = recipes;
      _filteredRecipes = recipes;

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

      body:
      Padding(
  padding: const EdgeInsets.all(20.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextField(
        controller: _searchController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Suche Rezept",
          hintStyle: TextStyle(color: Colors.white70), // Kleiner Tipp: Farbe für den Platzhalter
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      

      
       _filteredRecipes.isEmpty
          ? Center(
              child: Text(
                'Noch keine Rezepte vorhanden.\nFüge dein erstes Rezept hinzu!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white), // Tipp: Farbe für den Text
              ),
            )
          : Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: _filteredRecipes.length,
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 15.0,
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final recipe = _filteredRecipes[index];
                  return EventTile(
                    name: recipe.title,
                    category: recipe.category,
                    imagePath: 'lib/images/spiegelei.png', // Platzhalterbild
                    details: () {
                      _showRecipeDetails(recipe);
                    },
                    onLongPress: () {
                      _showOptionsDialog(recipe);
                    },
                  );
                },
              ),
          ),
    ]
    ),
),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 238, 149, 32),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddRecipeScreen()),
          ).then((_) {
            // Nach dem Hinzufügen die Liste neu laden
            _loadRecipes();
          });
        },
        child: Icon(Icons.add, color: Colors.white),
        tooltip: 'Rezept hinzufügen',
      ),
    );
  }

  void _showRecipeDetails(Recipe recipe) {
    Navigator.push(
      context as BuildContext,
      MaterialPageRoute(builder: (context) => RezeptPage(recipe: recipe)),
    );
  }
}
