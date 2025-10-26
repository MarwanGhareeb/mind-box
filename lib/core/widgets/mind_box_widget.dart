import 'package:flutter/material.dart';

class MindBoxWidget extends StatelessWidget {
  const MindBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                colors: [
                  Color(0xFFB24592),
                  Color(0xFFF15F79),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 15,
                  offset: Offset(0, 6), // ظل ناعم لتحت
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                'assets/images/brain.png',
                width: 40,
                height: 40,
                color: Colors.white, // يخلي الأيقونة بيضاء زي اللي في الصورة
              ),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            "Mind Box",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }
}
