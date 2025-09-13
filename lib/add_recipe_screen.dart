// lib/add_recipe_screen.dart
import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'rezept.dart';

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
    'Hauptgericht',
    'Vorspeise',
    'Dessert',
    'Snack',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rezept hinzufügen')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Titel eingeben
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Rezept-Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Kategorie auswählen
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(
                labelText: 'Kategorie',
                border: OutlineInputBorder(),
              ),
              items: _categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
            ),
            SizedBox(height: 16),

            // Zutaten eingeben
            TextField(
              controller: _ingredientsController,
              decoration: InputDecoration(
                labelText: 'Zutaten',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),

            // Anleitung eingeben
            TextField(
              controller: _instructionsController,
              decoration: InputDecoration(
                labelText: 'Zubereitung',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            SizedBox(height: 20),

            // Speichern Button
            ElevatedButton(
              onPressed: _saveRecipe,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text('Rezept speichern'),
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
