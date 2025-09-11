import 'package:flutter/material.dart';

class RezeptPage extends StatefulWidget {
  const RezeptPage({super.key});

  @override
  State<RezeptPage> createState() => _RezeptPageState();
}

bool isDarkMode = false;

class _RezeptPageState extends State<RezeptPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode
          ? Colors.black
          : const Color.fromARGB(255, 120, 156, 122),
      appBar: AppBar(
        title: const Text(
          "Rezepte",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(94, 49, 110, 77),
        elevation: 0,
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
      body: Center(
        child: Column(
          children: [
            Image.asset("lib/images/spiegelei.png", height: 300),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(87, 255, 255, 255),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 90),

              child: const Text(
                "Rezeptname",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(134, 137, 214, 137),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),

              child: const Text(
                "Kategorie",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(97, 255, 255, 255),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 90),

              child: const Text(
                "Zutaten",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(82, 255, 255, 255),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 90),

              child: const Text(
                "Zubereitung",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
