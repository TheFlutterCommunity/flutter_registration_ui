import 'package:flutter/material.dart';

class Utils{
  static String getPasswordComplexityLabel(String password){
    RegExp regExp1 = new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    RegExp regExp2 = new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])');
    RegExp regExp3 = new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])');
    RegExp regExp4 = new RegExp(r'^(?=.*?[a-z])');
     if(regExp1.hasMatch(password)){
       return 'Very Strong';
     } else if(regExp2.hasMatch(password)){
       return 'Strong';
     } else if(regExp3.hasMatch(password)){
       return 'Medium';
     } else if(regExp4.hasMatch(password)){
       return 'Very Weak';
     } else {
       return 'Very Weak';
     }
  }
  static Color getPasswordComplexityLabelColor(String password){
    RegExp regExp1 = new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    RegExp regExp2 = new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])');
    RegExp regExp3 = new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])');
    RegExp regExp4 = new RegExp(r'^(?=.*?[a-z])');
    if(regExp1.hasMatch(password)){
      return Colors.green;
    } else if(regExp2.hasMatch(password)){
      return Colors.green;
    } else if(regExp3.hasMatch(password)){
      return Colors.orangeAccent;
    } else if(regExp4.hasMatch(password)){
      return Colors.orangeAccent;
    } else {
      return Colors.orangeAccent;
    }
  }

  static bool isLowerCase(String password){
    RegExp regExp = new RegExp(r'^(?=.*?[a-z])');
    return regExp.hasMatch(password);
  }
  static bool isUpperCase(String password){
    RegExp regExp = new RegExp(r'^(?=.*?[A-Z])');
    return regExp.hasMatch(password);
  }
  static bool isNumberCase(String password){
    RegExp regExp = new RegExp(r'^(?=.*?[0-9])');
    return regExp.hasMatch(password);
  }
  static bool isSpecialSymbolCase(String password){
    RegExp regExp = new RegExp(r'^(?=.*?[!@#\$&*~]).{8,}$');
    return regExp.hasMatch(password);
  }
}