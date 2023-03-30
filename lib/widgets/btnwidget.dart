import 'package:flutter/material.dart';

class custombutton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;

  const custombutton({
    Key? key,
    required this.title,
    this.color = const Color(0xffa5a5a5),
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
