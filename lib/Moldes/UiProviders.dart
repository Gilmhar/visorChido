// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Uiprovider extends ChangeNotifier {
  int _selectedMenuOpt = 0;
  int get selectedMenuOpt {
    return _selectedMenuOpt;
  }

  set selectedMenuOpt(int i) {
    _selectedMenuOpt = i;
    notifyListeners();
  }
}
