import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  final String name;
  final String category;
  final String imagePath;
  final String ranking;
  // final void Function()? details;

const EventTile({
  required this.ranking,
  required this.name,
  required this.category,
  required this.imagePath,
  // required this.details,
  super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20)
      ),
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Image.asset(imagePath),
        Text(name),
        Row (
          children: [
            Text(category),
            Text(ranking),
          ],
        )
        
      ],)
    );
  }
}
