// lib/add_recipe_screen.dart
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'rezept.dart';
import 'components/text_field_zutaten.dart';

class AddRecipeScreen extends StatefulWidget {
  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  // Controller für die Textfelder
  final _titleController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _instructionsController = TextEditingController();

  String _selectedCategory = 'Hauptgericht';
  final List<String> _categories = [
    'Frühstück',
    'Hauptgericht',
    'Dessert',
    'Snack',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 120, 156, 122),
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
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Titel eingeben
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: ZutatenTextField(
                controller: _titleController,
                name: "Rezeptname",
                bulletList: false,
                maxLines: 1,
              ),
            ),

            SizedBox(height: 16),

            // Kategorie auswählen
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 25.0),

              child: DropdownButtonFormField2<String>(
                decoration: InputDecoration(
                  labelText: 'Kategorie',
                  labelStyle: TextStyle(fontSize: 16, color: Colors.white),
                  fillColor: Color.fromARGB(255, 49, 87, 50),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: EdgeInsets.all(15),
                ),
                value: _selectedCategory,

                items: _categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(
                      category,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue!;
                  });
                },
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 71, 121, 82),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Zutaten eingeben
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: ZutatenTextField(
                controller: _ingredientsController,
                name: 'Zutaten',
                bulletList: true,
                maxLines: 3,
              ),
            ),
            SizedBox(height: 16),

            // Anleitung eingeben
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: ZutatenTextField(
                controller: _instructionsController,
                name: 'Zutaten',
                bulletList: true,
                maxLines: 3,
              ),
            ),
            SizedBox(height: 20),

            // Speichern Button
            ElevatedButton(
              onPressed: _saveRecipe,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 238, 149, 32),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'Rezept speichern',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Rezept speichern
  void _saveRecipe() async {
    // Prüfen ob alle Felder ausgefüllt sind
    if (_titleController.text.isEmpty ||
        _ingredientsController.text.isEmpty ||
        _instructionsController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Bitte alle Felder ausfüllen!')));
      return;
    }

    // Neues Rezept erstellen
    Recipe newRecipe = Recipe(
      title: _titleController.text,
      ingredients: _ingredientsController.text,
      instructions: _instructionsController.text,
      category: _selectedCategory,
    );

    // In Datenbank speichern
    await DatabaseHelper().saveRecipe(newRecipe);

    // Erfolgsmeldung
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Rezept wurde gespeichert!')));

    // Zurück zur vorherigen Seite
    Navigator.pop(context);
  }
}
