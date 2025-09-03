import 'package:flutter/material.dart';

class ZutatenTextField extends StatefulWidget {
  const ZutatenTextField({super.key});

  @override
  State<ZutatenTextField> createState() => _ZutatenTextFieldState();
}

class _ZutatenTextFieldState extends State<ZutatenTextField> {
  final TextEditingController myTextController1 = TextEditingController();

  @override
  void initState() {
    super.initState();

    myTextController1.addListener(() {
      final oldText = myTextController1.text;
      final lines = oldText.split('\n');

      List<String> newLines = [];

      for (var line in lines) {
        final trimmedLine = line.trimLeft();

        if (trimmedLine.isEmpty) {
          newLines.add('');
        }
        // Wenn Zeile schon mit "•" beginnt (auch mit Leerzeichen davor) → nicht nochmal hinzufügen
        else if (trimmedLine.startsWith('•')) {
          newLines.add(line);
        }
        // Nur Zeilen, die NICHT mit • beginnen → hinzufügen
        else {
          newLines.add('• $trimmedLine');
        }
      }

      final newText = newLines.join('\n');

      if (newText != oldText) {
        final cursorOffset = myTextController1.selection.baseOffset;
        final offsetDiff = newText.length - oldText.length;

        myTextController1.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(offset: cursorOffset + offsetDiff),
        );
      }
    });
  }

  @override
  void dispose() {
    myTextController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myTextController1,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Zutaten",
        hintStyle: TextStyle(color: const Color.fromARGB(150, 255, 255, 255)),
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
        contentPadding: EdgeInsets.all(16),
      ),
    );
  }
}
