import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);
    client.connectionTimeout = const Duration(seconds: 30);
    client.badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
    return client;
  }
}