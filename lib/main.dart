// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:surveyapp/models/authentication.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surveyapp/config/verifi_colors.dart';
import 'package:surveyapp/models/login.dart';
import 'package:surveyapp/models/graphql.dart';
import 'package:surveyapp/bloc/bloc.dart';
import 'package:surveyapp/models/user_data.dart';
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
            return Home();
          }
          return Login();
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
    // WidgetsBinding.instance.addPostFrameCallback((_) => initMethod(context));
    final HttpLink httpLink = HttpLink(
      uri: 'https://700f317a.ngrok.io/graphql',
    );

    final AuthLink authLink = AuthLink(
      getToken: () async => await Authentication.getToken(),
    );

    final Link link = authLink.concat(httpLink as Link);

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: link,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          builder: (BuildContext context) => AuthenticationBloc(),
        ),
      ],
      
      child:
          GraphQLProvider(
            client: client,
          child:
          MaterialApp(
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
      ),
    );
  }
}
