enum Flavor {
  dev,
  staging,
  prod,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Test Dev';
      case Flavor.staging:
        return 'Test Staging';
      case Flavor.prod:
        return 'Test Flavor';
    }
  }

}
