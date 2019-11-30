import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:surveyapp/models/authentication.dart';

class API {
  static String _baseURL = DotEnv().env['ENDPOINT'];

  // auth endpoints
  static String login = _baseURL + "login";
  
}
