// ignore: file_names
import 'package:shared_preferences/shared_preferences.dart';

String getCloudUrl() {
  var data = "https://chainprojectapi.herokuapp.com/rest/api/user/login";
  // var data = "http://192.168.100.7:3322/";
  // var data = "http://192.168.100.20:3322/";
  // var data = "http://192.168.100.16:3322/";
  return data;
}

void logoutCleaner() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("name");
  prefs.remove("token");
  prefs.remove("refCode");
  prefs.remove("id");
}

Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var data = prefs.getString("token")!;

  // if (data == null) {
  //   return null;
  // }
  return data;
}

Future<String?> getUserName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var data = prefs.getString("name")!;

  // if (data == null) {
  //   return null;
  // }
  return data;
}
Future<String?> getRefCode() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var data = prefs.getString("refCode")!;

  // if (data == null) {
  //   return null;
  // }
  return data;
}

Future<String?> userId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var data = prefs.getString("id")!;

  // if (data == null) {
  //   return null;
  // }
  return data;
}
// Future<String?> getName() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var data = prefs.getString("name")!;

  // if (data == null) {
  //   return null;
  // }
  // return data;
// }

// Future<String?> getRole() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var data = prefs.getString("role")!;
//   // if (data == null) {
//   //   return null;
//   // }
//   return data;
// }
