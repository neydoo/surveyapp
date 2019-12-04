import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:surveyapp/models/authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surveyapp/config/verifi_colors.dart';
import 'package:surveyapp/models/login.dart';
import 'package:surveyapp/bloc/bloc.dart';
import './homeScreen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  runApp(AppMain());
}

class Survey extends StatefulWidget {
  // answers.add();

  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  @override
  void initState() {
    super.initState();
    final _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _authenticationBloc.dispatch(FetchAuthState());
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc _authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return BlocBuilder(
      bloc: _authenticationBloc,
      builder: (BuildContext context, AuthenticationState state) {
        if (state is InitialAuthenticationState) {
          return Scaffold();
        } else if (state is LoadedAuthState) {
          if (state.auth) {
            return Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 200),
              child: SplashScreen(
                seconds: 5,
                navigateAfterSeconds: Home(),
                backgroundColor: Colors.white,
                loaderColor: Colors.white,
                image: new Image.asset(
                  'assets/img/png/corona.jpg',
                  height: MediaQuery.of(context).size.height * 4.921,
                  width: MediaQuery.of(context).size.width * 4.921,
                ),
              ),
            );
          }
          return Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 200),
            child: SplashScreen(
              seconds: 5,
              navigateAfterSeconds: Login(),
              loaderColor: Colors.white,
              backgroundColor: Colors.white,
              image: new Image.asset(
                'assets/img/png/corona.jpg',
                height: MediaQuery.of(context).size.height * 4.921,
                width: MediaQuery.of(context).size.width * 4.921,
              ),
            ),
          );
        }
      },
    );
  }
}

class AppMain extends StatelessWidget {
  // GraphQLClient client;
  // initMethod(context) {
  //   client = GraphQLProvider.of(context).value;
  // }

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(
      uri: 'https://700f317a.ngrok.io/graphql',
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          builder: (BuildContext context) => AuthenticationBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Survey App",
        theme: ThemeData(
            primarySwatch: VerifiColors.green,
            canvasColor: Colors.transparent,
            accentColor: VerifiColors.blue,
            focusColor: VerifiColors.blue,
            hintColor: VerifiColors.blue,
            fontFamily: 'Lato'),
        home: Survey(),
      ),
    );
  }
}
