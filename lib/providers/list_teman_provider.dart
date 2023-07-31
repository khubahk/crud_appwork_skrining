import 'package:flutter/material.dart';

import '../services/users_api.dart';

class ListTemanProvider extends ChangeNotifier {
  Stream<String>? _userStream;

  ListTemanProvider() {
    _userStream = UserApi().getUsersStream();
  }

  Stream<String>? get userStream => _userStream;

  void refreshData() {
    _userStream = UserApi().getUsersStream();
    notifyListeners();
  }

  void deleteUser(String userId) {
    UserApi().deleteUser(userId);
    refreshData();
  }
}
