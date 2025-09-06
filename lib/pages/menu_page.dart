import 'package:flutter/material.dart';
import 'package:uebungsapp/components/event-tile.dart';

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
        ranking: "4",
        name: "Pfannekuchen",
        category: "Frühstück",
        imagePath: "lib/images/spiegelei.png",
        details: () {},
      ),
      EventTile(
        ranking: "5",
        name: "Hähnchen",
        category: "Hauptspeise",
        imagePath: "lib/images/chicken.png",
        details: () {},
      ),
      EventTile(
        ranking: "5",
        name: "Pudding",
        category: "Dessert",
        imagePath: "lib/images/pudding.png",
        details: () {},
      ),
    ];

    return Scaffold(
      backgroundColor:
      isDarkMode ? Colors.black : const Color.fromARGB(255, 120, 156, 122),
      appBar: AppBar(
        title: Text("Rezepte", style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(94, 49, 110, 77),
        leading: Icon(Icons.menu_rounded, color: Colors.white,),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(onPressed: (){ setState(() {
              isDarkMode = !isDarkMode;
            });
            }, icon: isDarkMode ? Icon(Icons.light_mode_rounded, color: Colors.white,) : Icon(Icons.dark_mode_rounded, color: Colors.white,)),
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
                      myButton(
                        event: () {},
                        mytext: 'Ansehen',
                        mycolor: Colors.lightGreen,
                        icon: Icons.trending_flat_rounded,
                      ),
                    ],
                  ),
                  Image.asset("lib/images/pumpkin.png", height: 100),
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
            SizedBox(height: 20),
            Text(
              "Rezepte",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: .0),
              child: myButton(
                event: () => Navigator.pushNamed(context, '/addrezept'),
                image: Image.asset('lib/images/diet.png', height: 60),
                mytext: 'Rezept hinzufügen',
                mycolor: const Color.fromARGB(255, 59, 104, 60),
                icon: Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
