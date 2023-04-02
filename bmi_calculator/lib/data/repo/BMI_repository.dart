import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class Repository with ChangeNotifier{
  double _weight = 0;
  double _height = 0;
  double _total = 0;
  String _gender = "";

  String get getGender => _gender;
  double get getTotal => _total;

  double get getWeight => _weight; 
  double get getHeight => _height;

  void setFemale(){
    _gender = "female";
    //print(_gender);
    notifyListeners();
  }

  void setWeight(double weight){
    _weight = weight;
    //print("Weight : ${_weight.toString()}");
    notifyListeners();
  }

  void setHeight(double height){
    _height = height;
    //print("Height : ${_height.toString()}");
    notifyListeners();
  }

  void setMale(){
    _gender = "male";
    //print(_gender);
    notifyListeners();
  }  

  void calculateBMI(double weight, double height){
    //print(pow((height*0.01), 2));
    //print(height*height);
    _total = weight/((height*height)/10000);

  }

}