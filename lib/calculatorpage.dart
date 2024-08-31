import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _input = "";
  String result = "";

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        _input = "";
        _output = "0";
        result = "";
      } else if (buttonText == "=") {
        try {
          Parser parser = Parser();
          Expression expression = parser.parse(_input);
          ContextModel cm = ContextModel();
          result = expression.evaluate(EvaluationType.REAL, cm).toString();
          _output = result;
        } catch (e) {
          _output = result;
        }
      } else {
        _input += buttonText;
        _output = _input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _input,
                    style: const TextStyle(fontSize: 50, color: Colors.black),
                  ),
                  Text(
                    _output,
                    style: const TextStyle(fontSize: 30, color: Colors.black54),
                  ),
                  /* Text(
                    result,
                    style: const TextStyle(fontSize: 30, color: Colors.blue),
                  ), */
                ],
              ),
            ),
          ),
          //const Divider(height: 1, color: Colors.grey),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blueGrey,
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  buildButton("AC", Colors.lightBlueAccent),
                  buildButton("(", Colors.yellowAccent),
                  buildButton(")", Colors.yellowAccent),
                  buildButton("%", Colors.lightGreenAccent),
                  buildButton("7", Colors.grey[200]!),
                  buildButton("8", Colors.grey[200]!),
                  buildButton("9", Colors.grey[200]!),
                  buildButton("/", Colors.lightGreenAccent),
                  buildButton("4", Colors.grey[200]!),
                  buildButton("5", Colors.grey[200]!),
                  buildButton("6", Colors.grey[200]!),
                  buildButton("*", Colors.lightGreenAccent),
                  buildButton("1", Colors.grey[200]!),
                  buildButton("2", Colors.grey[200]!),
                  buildButton("3", Colors.grey[200]!),
                  buildButton("-", Colors.lightGreenAccent),
                  buildButton("0", Colors.grey[200]!),
                  buildButton(".", Colors.grey[200]!),
                  buildButton("=", Colors.orangeAccent),
                  buildButton("+", Colors.lightGreenAccent),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(String buttonText, Color color) {
    return MaterialButton(
      onPressed: () => _buttonPressed(buttonText),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
        ),
      ),
      color: color,
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(20),
    );
  }
}
