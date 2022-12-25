import 'dart:convert';

import 'package:loginpage/user.dart';
import 'package:http/http.dart' as http;

// class RestAPIService {
//   String apiUrl = 'https://mocki.io/v1/ac9608c7-4af2-4ea1-8c5c-177faa641a4c';
//   Future<List<User>> getUsers() async {
//     final Response = await http.get(Uri.parse(apiUrl));
//   }

class RestAPIService {
  String apiUrl = 'https://mocki.io/v1/ed0c6388-7a27-4c27-942b-f1b6b358178e';
  //'https://mocki.io/v1/a0d8fb56-2a3b-461e-b2f0-61ce40b3f8c4';

  Future<List<User>> getUsers() async {
    // Make an HTTP request to the API to retrieve the list of users
    final response = await http.get(Uri.parse(apiUrl)); //(apiUrl);
    print(response.body);
    // Check the status code of the response
    if (response.statusCode == 200) {
      // If the request was successful, parse the JSON response
      // and return a list of user objects
      //return UserFromJson(response.body);
      return getUsersList(response.body);
    } else {
      // If the request was not successful, throw an exception
      throw Exception('Failed to load users');
    }
  }

//convert response body -> User object list
  List<User> getUsersList(String responseBody) {
    final parsedBody = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsedBody.map<User>((json) => User.fromJson(json)).toList();
  }
}
