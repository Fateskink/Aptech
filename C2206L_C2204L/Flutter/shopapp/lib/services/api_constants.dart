class APIConstants {
  static const String serverName = 'Nguyens-Mac-mini.local';
  static const int port = 8088;
  static const String basePath = 'api/v1';
  //remember NSAppTransportSecurity on ios
  static String get baseUrl {
    return 'http://$serverName:$port/$basePath';
  }
}
