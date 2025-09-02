import 'package:flutter/material.dart';

class AddRezept extends StatelessWidget {
  const AddRezept({super.key});

  @override
  Widget build(BuildContext context) {
    final myTextController = TextEditingController();
    final myTextController1 = TextEditingController();
    final myTextController2 = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Row with two TextFields
              Row(
                children: [
                  Expanded(child: TextField()),
                  const SizedBox(width: 10),
                  Expanded(child: TextField(controller: myTextController)),
                ],
              ),

              const SizedBox(height: 20),
              TextField(controller: myTextController1),
              const SizedBox(height: 20),
              TextField(controller: myTextController2),
              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    print(
                      "save schritt 1: ${myTextController.text}\n"
                      "save schritt 2: ${myTextController1.text}\n"
                      "save schritt 3: ${myTextController2.text}",
                    );
                  },
                  icon: const Icon(
                    Icons.archive_rounded,
                    color: Colors.green,
                    size: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
