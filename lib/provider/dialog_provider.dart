import 'package:flutter/cupertino.dart';

class DialogProvider with  ChangeNotifier{
  String _selectOption="";
  get selectOption=>_selectOption;
  void updateOption(String option){
    print(option);
    _selectOption=option;
    notifyListeners();
  }
}