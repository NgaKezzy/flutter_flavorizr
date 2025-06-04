import 'package:flutter/material.dart';
import 'app.dart';
import 'flavors.dart';
import 'config/environment.dart';

void main() {
  F.appFlavor = Flavor.dev;
  EnvironmentConfig.initialize();
  runApp(const App());
}
