import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static DateTime selectedDate = DateTime.now();

  static String getPasswordComplexityLabel(String password) {
    RegExp regExp1 = new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    RegExp regExp2 = new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])');
    RegExp regExp3 = new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])');
    RegExp regExp4 = new RegExp(r'^(?=.*?[a-z])');
    if (regExp1.hasMatch(password)) {
      return 'Very Strong';
    } else if (regExp2.hasMatch(password)) {
      return 'Strong';
    } else if (regExp3.hasMatch(password)) {
      return 'Medium';
    } else if (regExp4.hasMatch(password)) {
      return 'Very Weak';
    } else {
      return 'Very Weak';
    }
  }

  static Color getPasswordComplexityLabelColor(String password) {
    RegExp regExp1 = new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    RegExp regExp2 = new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])');
    RegExp regExp3 = new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])');
    RegExp regExp4 = new RegExp(r'^(?=.*?[a-z])');
    if (regExp1.hasMatch(password)) {
      return Colors.lightGreenAccent;
    } else if (regExp2.hasMatch(password)) {
      return Colors.lightGreenAccent;
    } else if (regExp3.hasMatch(password)) {
      return Colors.orangeAccent;
    } else if (regExp4.hasMatch(password)) {
      return Colors.orangeAccent;
    } else {
      return Colors.orangeAccent;
    }
  }

  static bool isLowerCase(String password) {
    RegExp regExp = new RegExp(r'^(?=.*?[a-z])');
    return regExp.hasMatch(password);
  }

  static bool isUpperCase(String password) {
    RegExp regExp = new RegExp(r'^(?=.*?[A-Z])');
    return regExp.hasMatch(password);
  }

  static bool isNumberCase(String password) {
    RegExp regExp = new RegExp(r'^(?=.*?[0-9])');
    return regExp.hasMatch(password);
  }

  static bool isSpecialSymbolCase(String password) {
    RegExp regExp = new RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    return regExp.hasMatch(password);
  }

  static Future<String> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      confirmText: 'Confirm'.toUpperCase(),
    );
    if (picked != null && picked != selectedDate) {
      return DateFormat('dd MMM yyyy').format(picked);
    }
    return null;
  }

  static Future<String> selectTime(BuildContext context) async {
    final TimeOfDay pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      confirmText: 'Confirm'.toUpperCase(),
    );
    if (pickedTime != null) {
      return '${pickedTime.hour}:${pickedTime.minute}';
    }
    return null;
  }

  static String validateEmail(String value, String error) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return error;
    else
      return null;
  }

  static bool isValidEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (regex.hasMatch(email))
      return true;
    else
      return false;
  }
}
