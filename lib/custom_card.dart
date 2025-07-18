import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  double? width;
  final Widget child;
  final Color colour;

  ReusableCard({
    super.key,
    this.width,
    required this.colour,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 200,
      width: width ?? 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour,
      ),
      child: child,
    );
  }
}