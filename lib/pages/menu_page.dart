
import 'package:flutter/material.dart';
import 'package:uebungsapp/components/event-tile.dart';

import '../components/button.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
  List EventList=[
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
      EventTile(ranking: "5",
       name: "Pudding",
        category: "Dessert",
         imagePath: "lib/images/pudding.png",
          details: () {},
          )
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 120, 156, 122),
      appBar: AppBar(
        title: Text("Rezepte"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(94, 49, 110, 77),
        leading: Icon(Icons.menu_rounded),
        actions: [ Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Icon(Icons.shopping_cart),
        )],

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
                children: [ Column( children: [
                  Text('Rezept', 
                  style: TextStyle(fontSize: 22, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.white 
                   ),
                  ),
                  SizedBox(height: 15),
                  myButton(event:(){} , mytext: 'Ansehen', mycolor: Colors.lightGreen,)
                  ],
                 ),
                 Image.asset("lib/images/pumpkin.png", height: 100
                 ,),
                
        
                ],
              ),
            ),
            SizedBox(height: 25),
          Padding( 
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField( decoration: InputDecoration(
             hintText:"Suche Rezept",
             enabledBorder: OutlineInputBorder
             (borderSide: BorderSide(
              color: Colors.white,
              width:2,
             ),
             borderRadius: BorderRadius.circular(20
             )
             ),
             border:OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width:2,
              ),
              borderRadius: BorderRadius.circular(20)
              )
             
             ),
             ),
          ),
          SizedBox(height: 25),
          Text("Rezepte", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
          SizedBox(height: 25),
          Expanded(
            child: ListView.builder(
            itemBuilder: (context, index) => EventList[index],

            itemCount: EventList.length,
            scrollDirection: Axis.horizontal,)
            
           
            
          )
          
          ],
        ),
      ),
    );
  }
}
