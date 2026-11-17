/// Environment and Application Configuration
/// Provides safe defaults and environment detection without storing hardcoded secrets.
enum AppEnvironment {
  development,
  staging,
  production,
}

class AppConfig {
  final AppEnvironment environment;
  final String appName;
  final String appVersion;

  const AppConfig({
    required this.environment,
    required this.appName,
    required this.appVersion,
  });

  bool get isDevelopment => environment == AppEnvironment.development;
  bool get isProduction => environment == AppEnvironment.production;

  /// Default development configuration
  static const AppConfig defaultConfig = AppConfig(
    environment: AppEnvironment.development,
    appName: 'Kulit Lumpia',
    appVersion: '1.0.0+1',
  );
}
