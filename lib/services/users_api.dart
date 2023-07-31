import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApi {
  final String apiUrl = 'https://capekngoding.com/628562550270/api/users';

  Stream<String> getUsersStream() async* {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      yield response.body;
    } else {
      throw Exception('Failed to get users: ${response.statusCode}');
    }
  }

  Future<void> createUser(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode(userData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create user: ${response.statusCode}');
    }
  }

  Future<void> updateUser(String userId, Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse('$apiUrl/$userId'),
      body: json.encode(userData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user: ${response.statusCode}');
    }
  }

  Future<void> deleteUser(String userId) async {
    final response = await http.delete(Uri.parse('$apiUrl/$userId'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user: ${response.statusCode}');
    }
  }
}
