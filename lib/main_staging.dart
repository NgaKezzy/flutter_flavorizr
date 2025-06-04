import 'package:flutter/material.dart';
import 'app.dart';
import 'flavors.dart';
import 'config/environment.dart';

void main() {
  F.appFlavor = Flavor.staging;
  EnvironmentConfig.initialize();
  runApp(const App());
}
