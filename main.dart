import 'package:flutter/material.dart';

const kMainColor = Colors.orangeAccent;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BmiCalculatorApp(),
    );
  }
}
  class BmiCalculatorApp extends StatefulWidget{

  @override
  _BmiCalculatorAppState createState() => _BmiCalculatorAppState();
}

class _BmiCalculatorAppState extends State<BmiCalculatorApp> {
  int height = 110;
  int weight = 60;
  CalculatorBrain ourBrain = CalculatorBrain();
  @override
    Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'BMI Calculator'
            ),
            backgroundColor: kMainColor,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight*5/100, horizontal: screenWidth*5/100),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth*2/100),
                          child: SizedBox(
                            height: screenHeight*25/100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Height',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: kMainColor,
                                ),),
                                SizedBox(
                                  height: screenHeight*10/100,
                                    width: screenWidth*35/100,
                                    child: TextField(
                                      onChanged: (String value){
                                        setState(() {
                                          height = int.parse(value);
                                        });
                                      },
                                    ),
                                ),
                                Text('cm',
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.grey[400],
                                ),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth*3/100,
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth*2/100),
                          child: SizedBox(
                            height: screenHeight*25/100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Weight',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: kMainColor,
                                  ),),
                                SizedBox(
                                  height: screenHeight*10/100,
                                  width: screenWidth*35/100,
                                  child: Slider(
                                    activeColor: kMainColor,
                                    inactiveColor: Colors.grey[400],
                                    value: 60,
                                    min:5,
                                    max:120,
                                    divisions: 115,
                                    label: weight.toString(),
                                    onChanged: (value){
                                      setState(() {
                                        weight = value.round();
                                      });
                                    },
                                  ),
                                ),
                                Text('kg',
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.grey[400],
                                  ),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
                SizedBox(
                  height: screenHeight*5/100,
                ),
                Container(
                  height: screenHeight*10/100,
                  child: MaterialButton(
                    color: kMainColor,
                    minWidth: screenWidth*90/100,
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: (){
                      setState(() {
                        ourBrain.calculate(height, weight);
                      });
                    },
                  ),
                ),
                SizedBox(
                   height: screenHeight*5/100,
                ),
                Container(
                  height: screenHeight*25/100,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Your BMI',
                      ),
                      Text('${ourBrain.bmi}',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 100,
                        ),),
                      Text('${ourBrain.description}'),
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
      );
  }
}


  class CalculatorBrain{
  int bmi;
  String description;

  CalculatorBrain(){
    bmi=0;
    description='Please input your info';
  }

  void calculate(int height, int weight){
    bmi = (weight*10000/(height*height)).round();
    if(bmi<=18.5){
      description ='You are underweight';}
    else if(bmi<=25){
      description = 'You are healthy';}
    else if(bmi<=30){
      description = 'You are a little overweight';
    }
    else{
      description = 'Try to eat healthy';
    }
  }
  }

