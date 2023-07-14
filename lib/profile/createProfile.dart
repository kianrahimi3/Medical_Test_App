import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_project/classes/person.dart';
import 'package:test_project/profile/profile.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  Person person = Person();
  HealthInfo healthInfo = HealthInfo();

  Future<DateTime?> _showDatePicker() {
    return showDatePicker(context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(DateTime.now().year + 1),
    );

  }

  final firstController = TextEditingController();
  final secondController = TextEditingController();
  final calendarController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  DateTime _dateTime = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: firstController,
              decoration: InputDecoration(
                hintText: "What is your first name?",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    firstController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
              onEditingComplete: () {
                person.first = firstController.text;
              },
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
            ),
            SizedBox(height: 10),
            TextField(
              controller: secondController,
              decoration: InputDecoration(
                hintText: "What is your last name?",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    secondController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
              onEditingComplete: () {
                person.last = secondController.text;
              },
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
            ),
            SizedBox(height: 10),
            TextField(
              controller: calendarController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Date of Birth",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () async {
                    //_dateTime
                    _dateTime = (await _showDatePicker())!;
                    String date = DateFormat('MM-dd-yyyy','en_US').format(DateTime.parse(_dateTime.toString()));
                    calendarController.text = date;
                  },
                  icon: const Icon(Icons.calendar_month),
                ),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                hintText: "User Name",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    userNameController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
              onEditingComplete: () {
                person.username = userNameController.text;
              },
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    passwordController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
              onEditingComplete: () {
                person.passsword = passwordController.text;
              },
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
            ),

            MaterialButton(
              onPressed: () {
                setState(() {
                  person.first = firstController.text;
                  person.last = secondController.text;
                  person.DOB = _dateTime;
                  person.username = userNameController.text;
                  person.passsword = passwordController.text;
                });
                print("${person.first} ${person.last} ${person.DOB} {${person.username} ${person.passsword}");

                healthInfo.basicInfo = person;

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                    builder: (context) => Profile(healthInfo: healthInfo)
                    ),
                );
              },
              elevation: 0,
              color: Colors.blue,
              child: const Text(
                "Create Profile",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
