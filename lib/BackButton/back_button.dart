import 'package:flutter/material.dart';

class BackButtons extends StatelessWidget {
  const BackButtons({Key? key, required this.color}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          top: 20,
        ),
        child: Text(
          "Back",
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
