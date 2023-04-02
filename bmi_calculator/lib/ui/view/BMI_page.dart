import 'dart:math';

import 'package:bmi_calculator/data/repo/BMI_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';


class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  bool manPressed = false;
  bool womanPressed = false;
  double _currentSliderValue = 130;
  double _currentSliderValue2 = 130;
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("BMI Calculator",style: TextStyle(color: Colors.black),),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Spacer(),
              Container(
                padding: EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width*0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: Size(100, 100),
                        ),
                        onPressed: (){
                          setState(() {
                            if(manPressed == false){
                              menChoose = Colors.blue;
                              womenChoose = Colors.grey;
                              womanPressed = false;
                              manPressed = true;
                              context.read<Repository>().setMale();
                            }else{
                              manPressed = false;
                              menChoose = Colors.grey;
                            }
                          });
                        }, child: Column(children: [
                        Icon(Icons.male,color: menChoose,),
                        Text("Male",style: TextStyle(color: menChoose),),
                      ],)),
                    ),
                    SizedBox(width: 50,),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: Size(100, 100),
                        ),
                        onPressed: (){
                          setState(() {
                            if(womanPressed == false){
                              womenChoose = Colors.pink;
                              menChoose = Colors.grey;
                              womanPressed = true;
                              manPressed = false;
                              context.read<Repository>().setFemale();
                            }else{
                              womanPressed = false;
                              womenChoose = Colors.grey;
                            }
                          });
                        }, child: Column(children: [
                        Icon(Icons.female,color: womenChoose,),
                        Text("Female",style: TextStyle(color: womenChoose),),
                      ],)),
                    ),                    
                  ],
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width*0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(),
                  color: Colors.white
                ),
                child: Column(
                  children: [
                   Text("Enter Your Height (cm)",style: TextStyle(color: Colors.grey,fontSize: 20),),
                    Slider(
                      min: 100,
                      max: 250,
                      value: _currentSliderValue,
                      label: _currentSliderValue.round().toString(),
                      divisions: 150, 
                      onChanged: (value){
                        setState(() {
                        _currentSliderValue = value;
                        });},
                        onChangeEnd: (_currentSliderValue) => context.read<Repository>().setHeight(_currentSliderValue)
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width*0.8,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  children: [

                        Text("Enter Your Weight (kg)",style: TextStyle(color: Colors.grey,fontSize: 20)),
                      
                    
                    Slider(
                      inactiveColor: Colors.grey,
                      activeColor: Colors.red,
                      min: 50,
                      max: 250,
                      value: _currentSliderValue2,
                      label: _currentSliderValue2.round().toString(),
                      divisions: 200, 
                      onChanged: (value){
                        setState(() {
                        _currentSliderValue2 = value;
                        });},
                        onChangeEnd: (_currentSliderValue2) => context.read<Repository>().setWeight(_currentSliderValue2)
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue
                  ),
                  onPressed: (){
                    setState(() {
                      context.read<Repository>().calculateBMI(_currentSliderValue2, _currentSliderValue);                   
                    });
      
                  //Navigator.push(context,MaterialPageRoute(builder: (context) => BMIResultPage(bmiResult: result,)));
                  Navigator.pushNamed(context, "/ResultSayfasi");
                }, child: Text("Calculate BMI",style: TextStyle(color: Colors.white),)),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
  Color womenChoose = Colors.grey;
  Color menChoose = Colors.grey;
}