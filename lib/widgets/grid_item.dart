import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
    final String title;
  final IconData icon;
  final bool isCircle;
  final VoidCallback onTap;

  const GridItem({
    required this.title,
    required this.icon,
    this.isCircle = false,
    required this.onTap,
  });

   @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            color: Colors.grey[200],
          ),
          padding: EdgeInsets.all(16),
          child: Icon(icon, size: 30, color: Color.fromRGBO(5, 5, 5, 1)),
        ),
        const SizedBox(height: 5),
        Text(title, style:const TextStyle(fontSize: 14)),
      ],
      ),
    );
  }
}
