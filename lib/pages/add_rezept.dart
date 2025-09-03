import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:uebungsapp/components/text_field_zutaten.dart';

class AddRezept extends StatelessWidget {
  const AddRezept({super.key});

  @override
  Widget build(BuildContext context) {
    final myTextController = TextEditingController();
    final myTextController1 = TextEditingController();
    final myTextController2 = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 120, 156, 122),
      appBar: AppBar(
        title: Text("Rezepte"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(94, 49, 110, 77),
        leading: Icon(Icons.menu_rounded),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Rezeptname",
                    hintStyle: TextStyle(
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
                  ),
                ),
              ),
              SizedBox(height: 20),

              DropdownButtonFormField2<String>(
                decoration: InputDecoration(
                  hintText: "Kategorie",
                  hintStyle: TextStyle(
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

              SizedBox(height: 20),
              ZutatenTextField(),
              // TextField(
              //   style: TextStyle(color: Colors.white),
              //   controller: myTextController1,
              //   decoration: InputDecoration(
              //     hintText: "Zutaten",
              //     hintStyle: TextStyle(
              //       color: const Color.fromARGB(150, 255, 255, 255),
              //     ),
              //     fillColor: Color.fromARGB(255, 49, 87, 50),
              //     filled: true,
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.white, width: 2),
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     border: OutlineInputBorder(
              //       borderSide: BorderSide(color: Colors.white, width: 2),
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //   //   ),
              //   // ),
              SizedBox(height: 20),

              TextField(
                controller: myTextController2,
                decoration: InputDecoration(
                  hintText: "Zubereitung",
                  hintStyle: TextStyle(
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
                ),
              ),
              SizedBox(height: 20),

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
