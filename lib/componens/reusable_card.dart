import 'package:flutter/material.dart';

class ReusabelCard extends StatelessWidget {
  const ReusabelCard(
      {required this.colour, required this.cardChild, required this.onPress});
  final Color colour;
  final Widget cardChild;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        height: 200,
        width: double.infinity,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
