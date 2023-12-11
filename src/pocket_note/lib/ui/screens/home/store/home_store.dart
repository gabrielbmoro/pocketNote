import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeBase with _$HomeStore;

abstract class HomeBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  void navigateToPowerBill(BuildContext context) {

  }
}