import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  final String mytext;
  final void Function()? event;
  const myButton({super.key, required this.event, required this.mytext});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: event,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 33, 108, 36),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              mytext,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.trending_flat, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
