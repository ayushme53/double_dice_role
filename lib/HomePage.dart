import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage one = AssetImage("images/one.png");
  AssetImage two = AssetImage("images/two.png");
  AssetImage three = AssetImage("images/three.png");
  AssetImage four = AssetImage("images/four.png");
  AssetImage five = AssetImage("images/five.png");
  AssetImage six = AssetImage("images/six.png");

  AssetImage defaultImageFirstDice, defaultImageSecondDice;

  @override
  void initState() {
    super.initState();
    defaultImageFirstDice = one;
    defaultImageSecondDice = one;
  }

  void rollDice() {
    var randNumFirstDice = (1 + Random().nextInt(6));
    var randNumSecondDice = (1 + Random().nextInt(6));
    AssetImage randImageFirstDice = getRandomImageNumber(randNumFirstDice);
    AssetImage randImageSecondDice = getRandomImageNumber(randNumSecondDice);

    setState(() {
      defaultImageFirstDice = randImageFirstDice;
      defaultImageSecondDice = randImageSecondDice;
    });
  }

  AssetImage getRandomImageNumber(var randomNumber) {
    switch (randomNumber) {
      case 1:
        return one;
      case 2:
        return two;
      case 3:
        return three;
      case 4:
        return four;
      case 5:
        return five;
      case 6:
        return six;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text("Dice Roller"),
        ),
        body: Container(
            margin: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
                color: Colors.white),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                          child: Container(
                              margin: EdgeInsets.all(20.0),
                              child: Image(image: defaultImageFirstDice))),
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.all(20.0),
                            child: Image(image: defaultImageSecondDice)),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50.0),
                    child: RaisedButton(
                      child: Text("Roll the dice!",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      onPressed: rollDice,
                      padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      color: Colors.orange,
                    ),
                  )
                ],
              ),
            )));
  }
}
