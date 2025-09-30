import 'package:flutter/material.dart';
import 'package:uebungsapp/add_recipe_screen.dart';
import 'package:uebungsapp/components/event-tile.dart';
import 'package:uebungsapp/pages/rezept_page.dart';
import 'package:uebungsapp/recipe_list_screen.dart';

import '../rezept.dart';
import '../database_helper.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool isDarkMode = false;
  List<Recipe> _recipes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode
          ? Colors.black
          : const Color.fromARGB(255, 120, 156, 122),
      appBar: AppBar(
        title: Text(
          "Rezepte",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(94, 49, 110, 77),
        leading: Icon(Icons.menu_rounded, color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isDarkMode = !isDarkMode;
                });
              },
              icon: isDarkMode
                  ? Icon(Icons.light_mode_rounded, color: Colors.white)
                  : Icon(Icons.dark_mode_rounded, color: Colors.white),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              margin: EdgeInsets.symmetric(horizontal: 25),

              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 53, 110, 55),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    'Rezept',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            111,
                            185,
                            68,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecipeListScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Meine Rezepte anzeigen',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Image.asset("lib/images/pumpkin.png", height: 70),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Text(
              "Rezepte",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,

                itemCount: _recipes.length,
                itemBuilder: (BuildContext context, int index) {
                  final recipe = _recipes[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EventTile(
                      name: recipe.title,
                      category: recipe.category,
                      imagePath: 'lib/images/spiegelei.png', // Platzhalterbild
                      details: () {
                        _showRecipeDetails(recipe);
                      },
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0, left: 25, right: 25),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 53, 110, 55),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddRecipeScreen()),
                  );
                },

                child: Row(
                  children: [
                    Text(
                      'Rezept hinzufügen',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    // Image.asset("lib/images/diet.png", height: 40),
                    SizedBox(width: 10),
                    Icon(Icons.add, color: Colors.white, size: 30),
                    // Spacer(), // Dieser Spacer schiebt alles, was danach kommt, nach rechts
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRecipeDetails(Recipe recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RezeptPage(recipe: recipe)),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadRecipes(); // Sagt der Seite: "Lade die Rezepte, sobald du startest!"
  }

  // Die Anleitung, wie die Rezepte aus der Datenbank geladen werden
  void _loadRecipes() async {
    final allrecipes = await DatabaseHelper().getAllRecipes();
    allrecipes.shuffle(); // Mische die Liste der Rezepte
    setState(() {
      _recipes = allrecipes
          .take(4)
          .toList(); // Nimm die ersten 4 Rezepte aus der gemischten Liste
    });
  }
}
