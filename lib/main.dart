import 'dart:html';

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
      debugShowCheckedModeBanner: false,
      title: 'BMI App',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  
 

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   var wtcontroller = TextEditingController();
  var fitcontroller = TextEditingController();
  var incontroller = TextEditingController();
  var result="";
  var bgcolor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
      
        title: Text('BMI Calculation App'),
      ),
      
      body:  Container(
          color: bgcolor,
          child: Center(
            
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('BMI',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller : wtcontroller,
                    decoration: InputDecoration(
                      label: Text('Enter your weight (in kgs)'),
                      prefixIcon: Icon(Icons.line_weight),
                      
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller : fitcontroller,
                    decoration: InputDecoration(
                      label: Text('Enter your height (in fit)'),
                      prefixIcon: Icon(Icons.height),
                      
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller : incontroller,
                    decoration: InputDecoration(
                      label: Text('Enter your height (in inches)'),
                      prefixIcon: Icon(Icons.height),
                      
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: Text('Calculate'),
                    onPressed: (){
                      var wt = wtcontroller.text.toString();
                      var ft = fitcontroller.text.toString();
                      var inn = incontroller.text.toString();
        
                        if(wt!=""&& ft!=""&& inn!=""){
                        
                        // BMI calucation
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iiin = int.parse(inn);
        
                        var tiin = (ift*12) + iiin;
        
                        var tcm = tiin*2.54;
                        var tm = tcm/100;
                        
                        var bmi = iwt/(tm*tm);

                         var mgs='';

                        if(bmi>25){
                        mgs = "You are over weight !!!";
                        bgcolor = Colors.red;
                        }
                        else if(bmi<18){
                        mgs = "You are  under weight !!!";
                        bgcolor = Colors.orange;

                        }
                        else{
                    
                           mgs = "You are healthy";
                           bgcolor = Colors.green;

                        }
                        
                        setState(() {
                          result = "$mgs \n your BMI is : ${bmi.toStringAsFixed(4)}";
                        });
                  
                        }
                        else{
                          setState(() {
                            result = "please fill all the reqired binks";
                          });
                        }
        
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(result,style: TextStyle(fontSize: 19),),
                ],
              ),
            ),
          ),
        ),
      );
    
  }
}
  