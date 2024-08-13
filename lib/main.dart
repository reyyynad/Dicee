// ignore_for_file: prefer_const_constructors
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(251, 206, 216, 1),
        appBar: AppBar(
          title: Text(
            'MyDicee',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Color.fromRGBO(231, 83, 126, 1),
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});
  @override
  State<DicePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int diceSum = 0;

  void changeDiceNumber() {
    setState(() {
      //which means it will change the //leftDiceNumber in all the widget and thus the screen will be updated, if we do not use it then the code will see the test and will not be updated thus the screen will not be updated
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      diceSum = leftDiceNumber + rightDiceNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1, // a ratio property for the expanded widget
              //the default flex is 1, you don't have to write it
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/dice$rightDiceNumber.png'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(231, 83, 126, 1),
          ),
          onPressed: () {
            changeDiceNumber();
            print('Button got pressed');
          },
          child: Text(
            'Roll Dice',
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        if (diceSum == 0)
          Text('')
        else if (diceSum == 12)
          Text(
            'It is your lucky day! You got double six',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          )
        else
          Text(
            'You got $diceSum',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
      ],
    );
  }
}
