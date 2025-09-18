import 'package:flutter/material.dart';
import 'package:uebungsapp/add_recipe_screen.dart';
import 'package:uebungsapp/components/event-tile.dart';
import 'package:uebungsapp/pages/recipes_screen.dart';
import 'package:uebungsapp/pages/rezept_page.dart';
import 'package:uebungsapp/recipe_list_screen.dart';

import '../rezept.dart';
import '../components/button.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    List eventList = [
      EventTile(
        name: "Pfannekuchen",
        category: "Frühstück",
        imagePath: "lib/images/spiegelei.png",
        details: () {
          // Erstelle ein temporäres Rezept-Objekt für die Demo
          final pfannkuchenRezept = Recipe(
            title: 'Pfannekuchen',
            category: 'Frühstück',
            ingredients: '250g Mehl\n2 Eier\n500ml Milch\n1 Prise Salz',
            instructions:
                '1. Mehl und Salz mischen.\n2. Eier und Milch hinzufügen und zu einem glatten Teig verrühren.\n3. In einer heißen Pfanne mit etwas Öl goldbraun backen.',
          );

          // Navigiere und gib das Rezept mit
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RezeptPage(recipe: pfannkuchenRezept),
            ),
          );
        },
      ),
      EventTile(
        name: "Hähnchen",
        category: "Hauptspeise",
        imagePath: "lib/images/chicken.png",
        details: () {},
      ),
      EventTile(
        name: "Pudding",
        category: "Dessert",
        imagePath: "lib/images/pudding.png",
        details: () {},
      ),
    ];

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                    ],
                  ),
                  Image.asset("lib/images/pumpkin.png", height: 90),
                ],
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Suche Rezept",
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
                itemCount: eventList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: eventList[index],
                ),
              ),
            ),

            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
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
                    Icon(Icons.add, color: Colors.white, size: 30),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0),
                      child: Image.asset("lib/images/diet.png", height: 35),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
