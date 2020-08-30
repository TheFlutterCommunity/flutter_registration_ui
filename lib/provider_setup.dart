import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = [
  //...independentServices,
  //...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildCloneableWidget> independentServices = [
  // API Service and viewmodel dependency
];

List<SingleChildCloneableWidget> dependentServices = [
  // API Service and viewmodel dependency
];

List<SingleChildCloneableWidget> uiConsumableProviders = [
];
