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
            return OrientationBuilder(builder: (context, orientation) {
              return orientation == Orientation.portrait
                  ? Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 200),
                      child: SplashScreen(
                        photoSize: 150,
                        seconds: 5,
                        navigateAfterSeconds: Home(),
                        backgroundColor: Colors.white,
                        loaderColor: Colors.white,
                        image: new Image.asset(
                          'assets/img/png/splash.png',
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 113),
                      child: SplashScreen(
                        photoSize: 70,
                        seconds: 5,
                        navigateAfterSeconds: Home(),
                        backgroundColor: Colors.white,
                        loaderColor: Colors.white,
                        image: new Image.asset(
                          'assets/img/png/splash.png',
                        ),
                      ),
                    );
            });
          }
          return OrientationBuilder(builder: (context, orientation) {
              return orientation == Orientation.portrait
                  ? Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 200),
                      child: SplashScreen(
                        photoSize: 150,
                        seconds: 5,
                        navigateAfterSeconds: Login(),
                        backgroundColor: Colors.white,
                        loaderColor: Colors.white,
                        image: new Image.asset(
                          'assets/img/png/splash.png',
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 113),
                      child: SplashScreen(
                        photoSize: 70,
                        seconds: 5,
                        navigateAfterSeconds: Login(),
                        backgroundColor: Colors.white,
                        loaderColor: Colors.white,
                        image: new Image.asset(
                          'assets/img/png/splash.png',
                        ),
                      ),
                    );
            });
        }
      },
    );
  }
}

class AppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
