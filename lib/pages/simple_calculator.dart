import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayText = "";
  double? num1;
  double? num2;
  String operation = "";

  void numClick(String text) {
    setState(() {
      displayText += text;
    });
  }

  void clear() {
    setState(() {
      displayText = "";
      num1 = null;
      num2 = null;
      operation = "";
    });
  }

  void operationClick(String op) {
    setState(() {
      if (displayText.isNotEmpty) {
        num1 = double.parse(displayText);
        operation = op;
        displayText = "";
      }
    });
  }

  void calculate() {
    if (displayText.isNotEmpty && num1 != null) {
      num2 = double.parse(displayText);
      double result = 0;

      switch (operation) {
        case '+':
          result = num1! + num2!;
          break;
        case '-':
          result = num1! - num2!;
          break;
        case '*':
          result = num1! * num2!;
          break;
        case '/':
          result = num1! / num2!;
          if (num1 == 0) {
            setState(() {
              displayText = "Error: Division by zero";
              num1 = null;
              num2 = null;
              operation = "";
            });
            return;
          }
          result = num1! / num2!;
          break;
      }

      setState(() {
        displayText = result.toString();
        num1 = result;
        num2 = null;
        operation = "";
      });
    }
  }

  Widget calcButton(String text, {Color? color, double fontSize = 24}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            backgroundColor: color ?? Colors.blueAccent,
          ),
          onPressed: () {
            if (text == "=") {
              calculate();
            } else if (text == "C") {
              clear();
            } else if ("+-*/".contains(text)) {
              operationClick(text);
            } else {
              numClick(text);
            }
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: text == "=" ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple Calculator")),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              displayText,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(thickness: 2),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    calcButton("7"),
                    calcButton("8"),
                    calcButton("9"),
                    calcButton("/", color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calcButton("4"),
                    calcButton("5"),
                    calcButton("6"),
                    calcButton("*", color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calcButton("1"),
                    calcButton("2"),
                    calcButton("3"),
                    calcButton("-", color: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calcButton("0"),
                    calcButton("C", color: Colors.redAccent),
                    calcButton("=", color: Colors.green, fontSize: 28),
                    calcButton("+", color: Colors.orange),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
