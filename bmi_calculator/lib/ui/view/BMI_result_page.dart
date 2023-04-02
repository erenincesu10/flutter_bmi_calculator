import 'package:bmi_calculator/data/repo/BMI_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';


class BMIResultPage extends StatefulWidget {
  BMIResultPage({super.key, });

  @override
  State<BMIResultPage> createState() => _BMIResultPageState();
}

class _BMIResultPageState extends State<BMIResultPage> {
  Color bmiColor = Colors.black;
  double? bmiResult;
  String level = ""; 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bmiResult = context.read<Repository>().getTotal;
    if(bmiResult! <= 18.5){
     bmiColor = Colors.blue;
     level = "Underweight"; 
    }else if(bmiResult! > 18.5 && bmiResult! <= 24.9){
      bmiColor = Colors.green;
      level = "Normal";
    }else if(bmiResult! > 24.9 && bmiResult! <= 29.9){
      bmiColor = Colors.yellow.shade500;
      level = "Overweight";
    }else if(bmiResult! > 29.9 && bmiResult! <= 34.9){
      bmiColor = Colors.orange;
      level = "Obese";
    }else if(bmiResult! > 34.9){
      bmiColor = Colors.red;
      level = "Extremely Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("BMI Calculator",style: TextStyle(color: Colors.black,),),
      ),
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(

                padding: EdgeInsets.all(12),
                height: MediaQuery.of(context).size.height*0.3,
                width: MediaQuery.of(context).size.width*0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(width: 5,color: bmiColor)
                ),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text("Your BMI is ${bmiResult!.round().toString()}",style: TextStyle(color: Colors.black,fontSize: 20),),
                    Text("Your level is : $level",style: TextStyle(color: Colors.black,fontSize: 18),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}