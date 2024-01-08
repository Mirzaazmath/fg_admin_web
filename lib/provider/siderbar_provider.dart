
import 'package:flutter/cupertino.dart';
class SideBarProvider with  ChangeNotifier{
  int _currentIndex=0;
  get currentIndex=>_currentIndex;
  void updateMenu(int index){
    _currentIndex=index;
    notifyListeners();
  }
}