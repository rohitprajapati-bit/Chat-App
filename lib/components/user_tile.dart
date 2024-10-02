import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserTile extends StatelessWidget {
  final String text;

  final void Function()? onTap;

  UserTile({
    super.key,
    required this.text,
    this.onTap,
  });
  Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      1000,
      random.nextInt(256), // red
      random.nextInt(256), // green
      random.nextInt(256), // blue
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Card(
          elevation: 3,
          color: Colors.grey.shade200,
          child: Container(
            decoration: BoxDecoration(
                // color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12)),
            // margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                // Icon(Icons.person),
                CircleAvatar(
                  backgroundColor: getRandomColor(),
                  radius: 25,
                  child: Text(
                    text[0].toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Icon(Icons.chevron_right_rounded)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
