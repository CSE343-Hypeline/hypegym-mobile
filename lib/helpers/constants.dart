import 'dart:io';
import 'dart:io' show Platform;

class Constants {
  Constants._();
  //static const baseUrl = 'http://localhost:8080';
  static String baseUrl = Platform.isAndroid ? 'http://0.0.0.0:8080' : 'http://localhost:8080';
//String baseUrl = Platform.isAndroid ? 'http://192.168.56.1:8080' : 'http://localhost:8080';
}
