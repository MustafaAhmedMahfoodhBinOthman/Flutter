import 'package:flutter/material.dart';
import 'package:roll_dice/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: GradientContainer(
            Colors.purple, Color.fromARGB(255, 238, 143, 255)),
      ),
    ),
  );
}
