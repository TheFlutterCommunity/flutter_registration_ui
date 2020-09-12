import 'package:flutter/material.dart';
import 'package:flutter_registration_ui/core/utils/Utils.dart';

class SignUpViewModel extends ChangeNotifier {
  int _selectedIndex = 0;
  String _date;
  String _time;
  bool _obscureText = true;
  bool _autoValidate = false;

  String _label;
  Color _labelColor;
  bool _isLowerCase = false;
  bool _isUpperCase = false;
  bool _isNumberCase = false;
  bool _isSpecialSymbolCase = false;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  String get date => _date;

  set date(String value) {
    _date = value;
    notifyListeners();
  }

  String get time => _time;

  set time(String value) {
    _time = value;
    notifyListeners();
  }

  bool get obscureText => _obscureText;

  set obscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }

  bool get autoValidate => _autoValidate;

  set autoValidate(bool value) {
    _autoValidate = value;
    notifyListeners();
  }

  String get label => _label;

  set label(String value) {
    _label = value;
    notifyListeners();
  }

  Color get labelColor => _labelColor;

  set labelColor(Color value) {
    _labelColor = value;
    notifyListeners();
  }

  bool get isLowerCase => _isLowerCase;

  set isLowerCase(bool value) {
    _isLowerCase = value;
    notifyListeners();
  }

  bool get isUpperCase => _isUpperCase;

  set isUpperCase(bool value) {
    _isUpperCase = value;
    notifyListeners();
  }

  bool get isNumberCase => _isNumberCase;

  set isNumberCase(bool value) {
    _isNumberCase = value;
    notifyListeners();
  }

  bool get isSpecialSymbolCase => _isSpecialSymbolCase;

  set isSpecialSymbolCase(bool value) {
    _isSpecialSymbolCase = value;
    notifyListeners();
  }

  void setPasswordComplexity(String value) {
    _label = Utils.getPasswordComplexityLabel(value);
    _labelColor = Utils.getPasswordComplexityLabelColor(value);
    _isLowerCase = Utils.isLowerCase(value);
    _isUpperCase = Utils.isUpperCase(value);
    _isNumberCase = Utils.isNumberCase(value);
    _isSpecialSymbolCase = Utils.isSpecialSymbolCase(value);
    notifyListeners();
  }
}
