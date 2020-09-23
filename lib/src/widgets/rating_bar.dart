import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final int count;
  final double value;
  final Color color;

  RatingBar({
    this.count = 5,
    this.value = 0.0,
    this.color = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(count, _buildStar),
    );
  }

  Widget _buildStar(int index) {
    IconData icon = Icons.star;
    Color clr = color;

    if (index >= value) {
      icon = Icons.star_border;
      clr = color.withOpacity(0.6);
    } else if (index > value - 1 && index < value) {
      icon = Icons.star_half;
    }

    return Icon(icon, color: clr, size: 16);
  }
}
