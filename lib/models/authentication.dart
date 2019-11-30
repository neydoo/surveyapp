
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  static storeToken(response) async {
    // save user details and token in shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // retrieve the data from the response

    await prefs.setString('token', response);
  }

  static logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', null);
  }

  static getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? "";
    return token;
  }

}
