import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:uebungsapp/components/button.dart';

class AddRezept extends StatelessWidget {
  const AddRezept({super.key});

  @override
  Widget build(BuildContext context) {
    final myTextController = TextEditingController();
    final myTextController1 = TextEditingController();
    final myTextController2 = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 120, 156, 122),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                TextField(),
                TextField(controller: myTextController),
              ],
            ),
            SizedBox(height: 20),
            TextField(controller: myTextController1),
            SizedBox(height: 20),
            TextField(controller: myTextController2),
            IconButton(
              onPressed: () => {
                print(
                  "save schritt 1 " +
                      myTextController.text +
                      "\nsave schritt 2 " +
                      myTextController1.text +
                      "\nsave schritt 3 " +
                      myTextController2.text,
                ),
              },
              icon: Icon(Icons.add, color: Colors.green, size: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}
