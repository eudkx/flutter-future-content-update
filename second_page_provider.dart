import 'dart:math';

import 'package:flutter/material.dart';

class SecondPageProvider extends ChangeNotifier {
  String numberOfList = '1';
  void changeTheNumberOfList(String number) {
    numberOfList = number;
    notifyListeners();
  }

  List<Map<int, String>> listData = [
    {
      0: '1',
      1: '2222',
      2: '1133311',
      3: '333',
    },
    {
      0: '2',
      1: '2224342',
      2: '3434',
      3: '333',
    },
    {
      0: '1',
      1: '22in the end22',
      2: '1133311',
      3: '333',
    },
    {
      0: '1',
      1: '222atil in the enda2',
      2: '113333311',
      3: '333',
    },
    {
      0: '1',
      1: '22dim worrieng about shit gad damn22',
      2: '1133311',
      3: '333',
    },
    {
      0: '3',
      1: '22343422',
      2: '113343433im ruflesss311',
      3: '33343443',
    },
    {
      0: '4',
      1: '22343422 build the full empire of city damn',
      2: '11334343311',
      3: '33343443',
    },
    {
      0: '3',
      1: '2235543422',
      2: '11334343311',
      3: '33343443',
    },
  ];

  Future<List<Map<int, String>>> filterTheList(String type) async {
    List<Map<int, String>> correctList = [];

    for (var element in listData) {
      // print(element[0] == numberOfList);
      if (element[0] == type) {
        correctList.add(element);
        // debugPrint;
      }
    }
    print(2);
    return correctList;
  }
}
