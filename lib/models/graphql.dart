import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlObject {
  static HttpLink httpLink = HttpLink(
    uri: 'https://700f317a.ngrok.io/graphql',
  );
  static AuthLink authLink = AuthLink();
  static Link link = httpLink as Link;
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ),
  );
}

String toggleIsCompletedMutation(result, index) {
  return ("""mutation ToggleTask{
         update_todo(where: {
          id: {_eq: ${result.data["todo"][index]["id"]}}},
          _set: {isCompleted: ${!result.data["todo"][index]["isCompleted"]}}) {
             returning {isCompleted } }
             }""");
}

String deleteTaskMutation(result, index) {
  return ("""mutation DeleteTask{       
              delete_todo(where: {id: {_eq: ${result.data["todo"][index]["id"]}}}) {
                 returning {id} }
                 }""");
}

String addTaskMutation(task) {
  return ("""mutation AddTask{
              insert_todo(objects: {isCompleted: false, task: "$task"}) {
                returning {id} }
                 }""");
}

String fetchQuery() {
  return ("""query TodoGet{
               todo {
                  id
                  isCompleted
                  task
                  }} """);
}

String loginQuery(email, password) {
  return ("""
     query login($email: String!, $password: String!) {
  login(email: $email, password: $password) {
    token
  }
}
""");
}

GraphQlObject graphQlObject = new GraphQlObject();
