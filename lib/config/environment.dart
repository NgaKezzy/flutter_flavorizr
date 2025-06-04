import '../flavors.dart';

class EnvironmentConfig {
  final String baseUrl;
  final Flavor flavor;

  EnvironmentConfig({
    required this.baseUrl,
    required this.flavor,
  });

  factory EnvironmentConfig.fromFlavor(Flavor flavor) {
    switch (flavor) {
      case Flavor.dev:
        return EnvironmentConfig(
          baseUrl: 'https://dev-api.example.com',
          flavor: flavor,
        );
      case Flavor.staging:
        return EnvironmentConfig(
          baseUrl: 'https://staging-api.example.com',
          flavor: flavor,
        );
      case Flavor.prod:
        return EnvironmentConfig(
          baseUrl: 'https://api.example.com',
          flavor: flavor,
        );
      default:
        throw Exception('Unknown flavor: $flavor');
    }
  }

  static late final EnvironmentConfig _instance;

  static void initialize() {
    _instance = EnvironmentConfig.fromFlavor(F.appFlavor);
  }

  static EnvironmentConfig get instance => _instance;
}
