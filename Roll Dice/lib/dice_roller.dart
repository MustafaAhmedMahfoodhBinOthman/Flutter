import 'package:flutter/material.dart';
import 'dart:math';

final random = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  // var activeDiceImage = 'images/dice-1.png';
  int activeDiceImage = 1;
  int activeDiceImage2 = 3;
  void rollDice() {
    setState(() {
      activeDiceImage = random.nextInt(6) + 1;
      activeDiceImage2 = random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/dice-$activeDiceImage.png',
              width: 150,
            ),
            Image.asset(
              'images/dice-$activeDiceImage2.png',
              width: 150,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          style: TextButton.styleFrom(),
          onPressed: rollDice,
          child: const Text(
            'Roll Dice',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
        ),
      ],
    );
  }
}
