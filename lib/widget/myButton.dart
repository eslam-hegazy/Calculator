import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color color;
  final onPress;
  const MyButton({
    Key? key,
    required this.title,
    required this.textColor,
    required this.color,
    required this.onPress,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            alignment: Alignment.center,
            color: color,
            child: Text(
              title,
              style: TextStyle(
                  color: textColor, fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
