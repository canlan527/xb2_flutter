import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {
  String pageName = '';
  String? resourceId;

  setResourceId(id) {
    resourceId = id;
    notifyListeners();
  }

  setPageName (value) {
    pageName = value;
    notifyListeners();
  }

}