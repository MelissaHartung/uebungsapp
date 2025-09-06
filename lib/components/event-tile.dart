import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  final String name;
  final String category;
  final String imagePath;
 
  final void Function()? details;

  const EventTile({
  
    required this.name,
    required this.category,
    required this.imagePath,
    required this.details,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 200,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 49, 87, 50),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(onTap: details, child: Image.asset(imagePath)),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
