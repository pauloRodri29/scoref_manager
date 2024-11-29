class AppRoutes {
  static AppRoutes? _instance;

  AppRoutes._();

  static AppRoutes get i {
    _instance ??= AppRoutes._();
    return _instance!;
  }
  final String initial = '/';
}