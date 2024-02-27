import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}



class _CalculatorHomeState extends State<CalculatorHome> {

  dynamic displaytxt = 20;

  Widget calculateBtn(String btnTxt, Color btnColor,Color txtColor){
    return Container(
      child: ElevatedButton(
        onPressed: (){
          calculation(btnTxt);
        },
        child:  Text('$btnTxt',
        style: TextStyle(
          fontSize: 35,
          color: txtColor
        ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          shape: CircleBorder(),
          padding: EdgeInsets.all(10),
        )
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Text('$text', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 100)
                      ,),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                calculateBtn('AC', Colors.grey, Colors.black),
                calculateBtn('+/-', Colors.grey, Colors.black),
                calculateBtn('%', Colors.grey, Colors.black),
                calculateBtn('/', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                calculateBtn('7', Colors.white10, Colors.white),
                calculateBtn('8', Colors.white10, Colors.white),
                calculateBtn('9', Colors.white10, Colors.white),
                calculateBtn('x', Colors.amber, Colors.white),
              ],
            ),

            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                calculateBtn('4', Colors.white10, Colors.white),
                calculateBtn('5', Colors.white10, Colors.white),
                calculateBtn('6', Colors.white10, Colors.white),
                calculateBtn('-', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                calculateBtn('1', Colors.white10, Colors.white),
                calculateBtn('2', Colors.white10, Colors.white),
                calculateBtn('3', Colors.white10, Colors.white),
                calculateBtn('+', Colors.amber, Colors.white),
              ],
            ),

            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                ElevatedButton(

                    onPressed: (){
                      calculation('0');
                    },
                    child: Text('0',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white
                    ),),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Colors.white10,
                    padding: EdgeInsets.fromLTRB(30, 5, 115, 5)
                  ),
                ),
                calculateBtn('.', Colors.white10, Colors.white),
                calculateBtn('=', Colors.amber, Colors.white),
              ],
            ),
            SizedBox(height: 10,)

          ],
        ),
      ),
    );
  }


  dynamic text ='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {


    if(btnText  == 'AC') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';

    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
        finalResult = add();
      } else if( preOpr == '-') {
        finalResult = sub();
      } else if( preOpr == 'x') {
        finalResult = mul();
      } else if( preOpr == '/') {
        finalResult = div();
      }

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if(opr == '+') {
        finalResult = add();
      } else if( opr == '-') {
        finalResult = sub();
      } else if( opr == 'x') {
        finalResult = mul();
      } else if( opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if(btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString()+'.';
      }
      finalResult = result;
    }

    else if(btnText == '+/-') {
      result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();
      finalResult = result;

    }

    else {
      result = result + btnText;
      finalResult = result;
    }


    setState(() {
      text = finalResult;
    });

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

    if(result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if(!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }

}



