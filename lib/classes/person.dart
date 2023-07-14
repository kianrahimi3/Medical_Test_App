import 'package:flutter/material.dart';

class Person {
  String first = "";
  String last = "";
  DateTime? DOB;
  String email = "";
  String username = "";
  String passsword = "";

}

class HealthInfo {
  Person basicInfo = Person();
  int bmi = 0;
  bool smoker = false;
  List<String> diagnosis = [];

  set person(Person person) {
    this.person = person;
  }

}