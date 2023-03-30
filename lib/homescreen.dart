import 'package:calculator/widgets/btnwidget.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var UserInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            UserInput.toString(),
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            answer.toString(),
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            custombutton(
                              title: "AC",
                              onPress: () {
                                UserInput = '';
                                answer = '';
                                setState(() {});
                              },
                            ),
                            custombutton(
                              title: "+/-",
                              onPress: () {},
                            ),
                            custombutton(
                              title: "%",
                              onPress: () {},
                            ),
                            custombutton(
                              title: "/",
                              color: Color(0xffffa00a),
                              onPress: () {},
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            custombutton(
                              title: "7",
                              onPress: () {
                                UserInput += '7';
                                setState(() {});
                              },
                            ),
                            custombutton(
                              title: "8",
                              onPress: () {
                                UserInput += '8';
                                setState(() {});
                              },
                            ),
                            custombutton(
                              title: "0",
                              onPress: () {
                                UserInput += '0';
                                setState(() {});
                              },
                            ),
                            custombutton(
                              title: "X",
                              color: Color(0xffffa00a),
                              onPress: () {
                                UserInput += 'x';

                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            custombutton(
                              title: "4",
                              onPress: () {
                                UserInput += '4';
                                setState(() {});
                              },
                            ),
                            custombutton(
                              title: "5",
                              onPress: () {
                                UserInput += '5';
                                setState(() {});
                              },
                            ),
                            custombutton(
                              title: "6",
                              onPress: () {
                                UserInput += '6';
                                setState(() {});
                              },
                            ),
                            custombutton(
                              title: "-",
                              color: Color(0xffffa00a),
                              onPress: () {
                                UserInput += '-';
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            custombutton(
                              title: "1",
                              onPress: () {
                                UserInput += '1';
                                setState(() {});
                              },
                            ),
                            custombutton(
                              title: "2",
                              onPress: () {
                                UserInput += '2';
                                setState(() {});
                              },
                            ),
                            custombutton(
                              title: "3",
                              onPress: () {
                                UserInput += '3';
                                setState(() {});
                              },
                            ),
                            custombutton(
                              title: "+",
                              color: Color(0xffffa00a),
                              onPress: () {
                                UserInput += '+';
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            custombutton(
                              title: "0",
                              onPress: () {
                                UserInput += '0';
                                setState(() {});
                              },
                            ),
                            custombutton(
                              title: ".",
                              onPress: () {
                                UserInput += '.';
                                setState(() {});
                              },
                            ),
                            custombutton(
                              title: "Del",
                              onPress: () {
                                UserInput = UserInput.substring(
                                    0, UserInput.length - 1);
                                setState(() {});
                              },
                            ),
                            custombutton(
                              title: "=",
                              color: Color(0xffffa00a),
                              onPress: () {
                                equalPress();
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void equalPress() {
    UserInput = UserInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(UserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, ContextModel());
    answer = eval.toString();
  }
}
