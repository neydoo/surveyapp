import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:surveyapp/models/authentication.dart';

class API {
  static String _baseURL = DotEnv().env['ENDPOINT'];

  // auth endpoints
  static String login = "https://1eb0edb7.ngrok.io/" + "auth/login";
  static String save = "https://1eb0edb7.ngrok.io/" + "survey/create";

/**keys for survey/create */
  // answer1
  // answer2
  // answer3
  // answer4
  // answer5
  // fullName
  // email
  // lat
  // lon
  // play

}
