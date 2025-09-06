import 'package:flutter/material.dart';
import 'package:uebungsapp/components/event-tile.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    List eventList = [
      EventTile(
      
        name: "Pfannekuchen",
        category: "Frühstück",
        imagePath: "lib/images/spiegelei.png",
        details: () {},
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
      TextField(
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
      
      SizedBox(height: 25),
      
  
      Text(
        "Rezepte (${eventList.length})",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      
      SizedBox(height: 15),
      
      
      Expanded(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 16, 
            mainAxisSpacing: 16, 
            childAspectRatio: 0.7, 
          ),
          itemCount: eventList.length,
          itemBuilder: (context, index) {
            return eventList[index];
          },
        ),
      ),
    ],
  ),

),
     );
  }
}