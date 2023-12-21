import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int index = 0;
  void changIndex(int i) {
    index = i;
    notifyListeners();
  }
}
