import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
//  void value
  var displaytxt = '';
  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          calculation(btntxt);
          setState(() {
            text = finalResult;
          });
        },
        child: Text(
          '$btntxt',
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        shape: CircleBorder(),
        color: btncolor,
        padding: EdgeInsets.all(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // claculator display
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      '$text',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 100),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton(
                    "AC",
                    Colors.grey,
                    Colors.black,
                  ),
                  calcbutton("+/-", Colors.grey, Colors.black),
                  calcbutton("%", Colors.grey, Colors.black),
                  calcbutton("/", Colors.amber, Colors.white),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton("7", Colors.grey, Colors.black),
                  calcbutton("8", Colors.grey, Colors.black),
                  calcbutton("9", Colors.grey, Colors.black),
                  calcbutton("X", Colors.amber, Colors.white),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton("4", Colors.grey, Colors.black),
                  calcbutton("5", Colors.grey, Colors.black),
                  calcbutton("6", Colors.grey, Colors.black),
                  calcbutton("-", Colors.amber, Colors.white),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton("1", Colors.grey, Colors.black),
                  calcbutton("2", Colors.grey, Colors.black),
                  calcbutton("3", Colors.grey, Colors.black),
                  calcbutton("+", Colors.amber, Colors.white),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    padding: EdgeInsets.fromLTRB(34, 20, 134, 34),
                    onPressed: () {
                      calculation('0');
                    },
                    shape: StadiumBorder(),
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 35, color: Colors.grey),
                    ),
                  ),
                  calcbutton(".", Colors.grey, Colors.black),
                  calcbutton("=", Colors.amber, Colors.white),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )),
    );
  }
}

dynamic text = '0';
double numOne = 0;
double numTwo = 0;
dynamic result = '';

dynamic finalResult = '';
dynamic opr = '';
dynamic preOpr = '';

void calculation(btnText) {
  if (btnText == 'AC') {
    text = '0';
    numOne = 0;
    numTwo = 0;
    result = '';
    finalResult = '0';
    opr = '';
    preOpr = '';
  } else if (opr == '=' && btnText == '=') {
    if (preOpr == '+') {
      finalResult = add();
    } else if (preOpr == '-') {
      finalResult = sub();
    } else if (preOpr == 'X') {
      finalResult = mul();
    } else if (preOpr == '/') {
      finalResult = div();
    }
  } else if (btnText == '+' ||
      btnText == '-' ||
      btnText == 'X' ||
      btnText == '/' ||
      btnText == '=') {
    if (numOne == 0) {
      numOne = double.parse(result);
    } else {
      numTwo = double.parse(result);
    }
    if (opr == '+') {
      finalResult = add();
    }
    if (opr == '-') {
      finalResult = sub();
    }
    if (opr == 'X') {
      finalResult = mul();
    }
    if (opr == '/') {
      finalResult = div();
    }
    preOpr = opr;
    opr == btnText;
    result = '';
  } else if (btnText == '%') {
    result = numOne / 100;
    finalResult = (result);
  } else if (btnText == '.') {
    if (!result.toString().contains('.')) {
      result = result.toString() + '.';
    }
    finalResult = result;
  } else if (btnText == '+/_') {
    result.toString().startsWith('-')
        ? result.toString().substring(1)
        : result = '-' + result.toString();
    finalResult = result;
  } else {
    result = result + btnText;
    finalResult = result;
  }
}

String add() {
  result = (numOne + numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}

String sub() {
  result = (numOne - numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}

String mul() {
  result = (numOne * numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}

String div() {
  result = (numOne / numTwo).toString();
  numOne = double.parse(result);
  return doesContainDecimal(result);
}

String doesContainDecimal(dynamic result) {
  if (result.toString().contains('.')) {
    List<String> spliteDecimal = result.toString().split('.');
    if (!(int.parse(spliteDecimal[1]) > 0))
      return result = spliteDecimal[0].toString();
  }
  return result;
}
