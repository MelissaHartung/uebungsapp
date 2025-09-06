import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:uebungsapp/components/text_field_zutaten.dart';

class AddRezept extends StatefulWidget {
  const AddRezept({super.key});

  @override
  State<AddRezept> createState() => _AddRezeptState();
}

class _AddRezeptState extends State<AddRezept> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    // final myTextController = TextEditingController();
    // final myTextController1 = TextEditingController();
    // final myTextController2 = TextEditingController();

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : const Color.fromARGB(255, 120, 156, 122),
      appBar: AppBar(
        title: Text("Rezepte", style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(94, 49, 110, 77),
        leading: Icon(Icons.menu_rounded, color: Colors.white,),
        actions: [ IconButton(onPressed: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        }, 
        icon: Icon(Icons.dark_mode_rounded),color: Colors.white,),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),

              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: ZutatenTextField(name: "Rezeptname", bulletList: false, maxLines: 1),
              ),

              

              // SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: DropdownButtonFormField2<String>(
                  decoration: InputDecoration(
                    labelText: "Kategorie",
                    labelStyle: TextStyle(
                      color: const Color.fromARGB(150, 255, 255, 255),
                    ),
                    fillColor: Color.fromARGB(255, 49, 87, 50),
                    filled: true,

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: EdgeInsets.all(15),
                  ),
                  iconStyleData: IconStyleData(
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  items:
                      <String>[
                        'Frühstück',
                        'Hauptspeise',
                        'Nachtisch',
                        'Snack',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Center(
                            child: Text(
                              value,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }).toList(),
                  onChanged: (String? newValue) {
                    // Hier müsstest du mit setState den Wert in einer Variable speichern
                    // (sobald du ein StatefulWidget hast)
                  },
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 71, 121, 82),
                    ),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: ZutatenTextField(name: "Zutat", bulletList: true, maxLines: 5,),
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: ZutatenTextField(name: "Zubereitung", bulletList: true, maxLines: 8,),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 50,
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 56, 80, 51),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.system_update_tv_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // print(
            ],

            //   "save schritt 1: ${myTextController.text}\n"
            //   "save schritt 2: ${myTextController1.text}\n"
            //   "save schritt 3: ${myTextController2.text}",
            // ),
          ),
        ),
      ),
    );
  }
}
