import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? firstNumber;
  int? secondNumber;
  int? textToDisplay = 0;
  String? res;
  int? operatorToperform;

  void btnClick(int btnvalue) {
    if (btnvalue == "c") {
      textToDisplay = 0;
      firstNumber = 0;
      secondNumber = 0;
      res = "";
    } else if (btnvalue == "+" ||
        btnvalue == "-" ||
        btnvalue == "x" ||
        btnvalue == "/") {
      firstNumber = int.parse(textToDisplay.toString());
      res = "";
      operatorToperform = btnvalue;
    } else if (btnvalue == "=") {
      secondNumber = int.parse(textToDisplay.toString());
      if (textToDisplay == "+") {
        res = (firstNumber! + secondNumber!).toString();
      }
      if (textToDisplay == "-") {
        res = (firstNumber! - secondNumber!).toString();
      }
      if (textToDisplay == "x") {
        res = (firstNumber! * secondNumber!).toString();
      }
      if (textToDisplay == "/") {
        res = (firstNumber! ~/ secondNumber!).toString();
      }
    } else {
      res = ((textToDisplay!) + (btnvalue)).toString();
    }

    setState(() {
      textToDisplay = int.parse(res!);
    });
  }

  Widget customButton(String btnvalue) {
    return Expanded(
        child: OutlinedButton(
            onPressed: () => btnClick(int.parse(btnvalue)),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                btnvalue,
                style: const TextStyle(fontSize: 20),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Text(
                "$textToDisplay",
                style: const TextStyle(fontSize: 35),
              ),
            )),
            Row(
              children: [
                customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("+"),
              ],
            ),
            Row(
              children: [
                customButton("6"),
                customButton("5"),
                customButton("4"),
                customButton("-"),
              ],
            ),
            Row(
              children: [
                customButton("3"),
                customButton("2"),
                customButton("1"),
                customButton("x"),
              ],
            ),
            Row(
              children: [
                customButton("c"),
                customButton("0"),
                customButton("="),
                customButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
