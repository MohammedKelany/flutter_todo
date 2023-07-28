import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key, required this.text, required this.size, required this.color, required this.maxLines})
      : super(key: key);
  final String text;
  final double size;
  final Color color;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: size, color: color,),maxLines: maxLines ,overflow: TextOverflow.ellipsis,),
    );
  }
}
