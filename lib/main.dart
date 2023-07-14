import 'package:flutter/material.dart';
import 'package:test_project/profile/createProfile.dart';
import 'package:test_project/profile/profile.dart';
import 'package:test_project/profile/showInfo.dart';

import 'package:test_project/classes/person.dart';
import 'package:test_project/profile/updateHealthInfo.dart';




void main() {
  Person person = Person();
  person.first = "Kian";
  person.last = "Rahimi";
  person.DOB = DateTime(2000, 01, 31);
  person.email = "kianrahimi3@hotmail.com";
  person.username = "wassup";
  person.passsword = "cuh";

  HealthInfo healthInfo = HealthInfo();
  healthInfo.basicInfo = person;
  healthInfo.diagnosis = ["fat", "lazy", "big chole", "gayyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"];

  runApp(
      MaterialApp(
        home: Profile(healthInfo: healthInfo),
        routes: {
          '/home': (context) => MyApp(),
          '/profile': (context) => Profile(healthInfo: healthInfo,),
          '/showInfo': (context) => ShowInfo(healthInfo: healthInfo,),
          'updateHealthInfo': (context) => UpdateHealthInfo(healthInfo: healthInfo),
        },
      ));
}

