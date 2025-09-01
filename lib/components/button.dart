import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  final String mytext;
  final void Function()? event;
  final Color mycolor;
  final IconData icon;
  final Widget? image;

  const myButton({
    super.key,
    required this.event,
    required this.mytext,
    required this.mycolor,
    required this.icon,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: event,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: mycolor,
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
            Icon(icon, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
