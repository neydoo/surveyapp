import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:surveyapp/models/authentication.dart';

class API {
  static String _baseURL = DotEnv().env['ENDPOINT'];

  // auth endpoints
  static String login = _baseURL + "auth/login";
  static String save = _baseURL + "survey/create";

/**keys for survey/create */
  // answer1
  // answer2
  // answer3
  // answer4
  // answer5
  // fullName
  // lat
  // lon
  // play

}
