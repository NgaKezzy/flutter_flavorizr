import 'package:flutter/material.dart';
import 'app.dart';
import 'flavors.dart';
import 'config/environment.dart';

void main() {
  F.appFlavor = Flavor.prod;
  EnvironmentConfig.initialize();
  runApp(const App());
}
