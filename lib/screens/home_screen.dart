import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String display = "0";
  double firstNumber = 0;
  String operation = '';
  bool newNumber = false;
  List<String> history = [];

  void showResult (double result){
  setState(() {
    if(result == result.toInt()){
      display = result.toInt().toString();
    } else{
      display = result.toString();
    }
  });
  }
  void pressDecimal(){
    if(!display.contains(".")){
      setState(() {
        display += ".";
      });
    }
  }
  void deleteLast(){
    setState(() {
      if(display.length > 1) {
        display = display.substring(0, display.length - 1);
      }else {
        display = "0";
      }
      });
  }
  void pressPercent() {
    setState(() {
      double number = double.parse(display);
      double result = number / 100;

      if (result == result.toInt()) {
        display = result.toInt().toString();
      } else {
        display = result.toString();
      }
    });
  }
  void clearHistory() {
    setState(() {
      history.clear();
    });
  }
  String formatNumber(double number) {
    if (number == number.toInt()) {
      return number.toInt().toString();
    } else {
      return number.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Calculator",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      centerTitle: true,
      backgroundColor: Colors.black45,
    ),
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    clearHistory();
                  },
                  child: const Text("Clear History"),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: history.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        child: Text(
                          history[index],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[900],
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerRight,
                      child: Text(
                        display,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 180,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),SizedBox( height: 10,width: 10,),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                        setState(() {
                          display = '0';
                          firstNumber = 0;
                          operation = '';
                        });
                        },
                        child: Text('C', style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(90),
                            padding: const
                            EdgeInsets.symmetric(vertical: 20,),
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox( height: 100,width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          deleteLast();
                        },
                        child: Text('⌫', style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(90),
                          padding: const
                          EdgeInsets.symmetric(vertical: 20,),
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox( height: 100,width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          pressPercent();
                        },
                        child: Text('%', style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(90),
                          padding: const
                          EdgeInsets.symmetric(vertical: 20,),
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 100, width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            firstNumber = double.parse(display);
                            operation = "/";
                            display = "0";
                          });
                        },
                        child: Text('÷', style: TextStyle(fontSize: 35,color: Colors.white, fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(90),
                          padding: const
                          EdgeInsets.symmetric(vertical: 20,),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox( height: 100,width: 10,),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          pressNumber("7");
                          },
                        child: Text('7', style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(90),
                          padding: const
                          EdgeInsets.symmetric(vertical: 20,),
                          backgroundColor: Colors.white10,
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox( height: 100,width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          pressNumber("8");
                        },
                        child: Text('8', style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(90),
                          padding: const
                          EdgeInsets.symmetric(vertical: 20,),
                          backgroundColor: Colors.white10,
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 100, width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          pressNumber("9");
                        },
                        child: Text('9', style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(90),
                          padding: const
                          EdgeInsets.symmetric(vertical: 20,),
                          backgroundColor: Colors.white10,
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox( height: 100,width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            firstNumber = double.parse(display);
                            operation = "*";
                            display = "0";
                          });
                        },
                        child: Text('×', style: TextStyle(fontSize: 35, color: Colors.white,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(90),
                          padding: const
                          EdgeInsets.symmetric(vertical: 20,),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox( height: 100,width: 10,),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          pressNumber("4");
                        },
                        child: Text('4', style: TextStyle(fontSize: 35,color: Colors.white, fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(90),
                          padding: const
                          EdgeInsets.symmetric(vertical: 20,),
                          backgroundColor: Colors.white10,
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox( height: 100,width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          pressNumber("5");
                        },
                        child: Text('5', style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(90),
                          padding: const
                          EdgeInsets.symmetric(vertical: 20,),
                          backgroundColor: Colors.white10,
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox( height: 100,width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          pressNumber("6");
                        },
                        child: Text('6', style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(90),
                          padding: const
                          EdgeInsets.symmetric(vertical: 20,),
                          backgroundColor: Colors.white10,
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox( height: 100,width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            firstNumber = double.parse(display);
                            operation = "-";
                            display = "0";
                          });
                        },
                        child: Text('-', style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(90),
                          padding: const
                          EdgeInsets.symmetric(vertical: 20,),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox( height: 100,width: 10,),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          pressNumber("1");
                        },
                        child: Text('1', style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(90),
                          padding: const
                          EdgeInsets.symmetric(vertical: 20,),
                          backgroundColor: Colors.white10,
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox( height: 100,width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          pressNumber("2");
                        },
                        child: Text('2', style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(90),
                          padding: const
                          EdgeInsets.symmetric(vertical: 20,),
                          backgroundColor: Colors.white10,
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox( height: 100,width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          pressNumber("3");
                        },
                        child: Text('3', style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(90),
                          padding: const
                          EdgeInsets.symmetric(vertical: 20,),
                          backgroundColor: Colors.white10,
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox( height: 100,width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed:(){
                          setState(() {
                            firstNumber = double.parse(display);
                            operation = "+";
                            display = "0";
                          });
                        },
                        child: Text('+', style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(90),
                          padding: const
                          EdgeInsets.symmetric(vertical: 20,),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox( height: 100,width: 10,),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          pressNumber("0");
                        },
                        child: Text('0', style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(90),
                          padding: const
                          EdgeInsets.symmetric(vertical: 20,),
                          backgroundColor: Colors.white10,
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox( height: 100,width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          pressDecimal();
                        },
                        child: Text('.', style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(90),
                          padding: const
                          EdgeInsets.symmetric(vertical: 20,),
                          backgroundColor: Colors.white10,
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox( height: 100,width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          double secondNumber = double.parse(display);

                          if (operation == "+") {
                            double result = firstNumber + secondNumber;

                            setState(() {
                              history.add(
                                "${formatNumber(firstNumber)} + ${formatNumber(secondNumber)} = ${formatNumber(result)}",
                              );
                            });

                            showResult(result);
                          }

                          if (operation == "-") {
                            double result = firstNumber - secondNumber;

                            setState(() {
                              history.add(
                                "${formatNumber(firstNumber)} - ${formatNumber(secondNumber)} = ${formatNumber(result)}",
                              );
                            });

                            showResult(result);
                          }

                          if (operation == "*") {
                            double result = firstNumber * secondNumber;

                            setState(() {
                              history.add(
                                "${formatNumber(firstNumber)} * ${formatNumber(secondNumber)} = ${formatNumber(result)}",
                              );
                            });

                            showResult(result);
                          }

                          if (operation == "/") {
                            if (secondNumber == 0) {
                              setState(() {
                                display = "Error";
                              });
                            } else {
                              double result = firstNumber / secondNumber;

                              setState(() {
                                history.add(
                                  "${formatNumber(firstNumber)} / ${formatNumber(secondNumber)} = ${formatNumber(result)}",
                                );
                              });

                              showResult(result);
                            }
                          }
                        },
                        child: Text('=', style: TextStyle(fontSize: 35, color: Colors.white,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(90),
                          padding: const
                          EdgeInsets.symmetric(vertical: 20,),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    SizedBox( height: 100,width: 10,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void pressNumber(String number){
    setState(() {
      if (display == "0"){
        display = number;
      } else {
        display += number;
      }
    });
  }

}

