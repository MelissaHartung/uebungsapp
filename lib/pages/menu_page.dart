import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 120, 156, 122),
      appBar: AppBar(
        title: Text("Rezepte"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(94, 49, 110, 77),
        leading: Icon(Icons.menu_rounded),
        actions: [],
      ),
    );
  }
}
