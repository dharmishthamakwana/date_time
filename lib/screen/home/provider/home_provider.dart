import 'package:flutter/material.dart';

class home_provider extends ChangeNotifier
{
  var currentDate = DateTime.now();
  var date = DateTime.now();

  TimeOfDay currentTime = TimeOfDay.now();
  TimeOfDay time = TimeOfDay.now();

  void ChangeDate(date)
  {
    date = currentDate;
    notifyListeners();
  }

  void ChangeTime(time)
  {
    time = currentTime;
    notifyListeners();
  }
}