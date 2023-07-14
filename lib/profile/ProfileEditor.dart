import 'package:flutter/material.dart';
import 'package:test_project/classes/person.dart';
import 'package:test_project/profile/profile.dart';
import 'package:intl/intl.dart';

class ProfileEditor extends StatefulWidget {

  Person person = Person();
  ProfileEditor({super.key, required this.person});

  @override
  State<ProfileEditor> createState() => _ProfileEditorState();
}

class _ProfileEditorState extends State<ProfileEditor> {
  //final Person person = Person();

  final firstController = TextEditingController();
  final secondController = TextEditingController();
  final calendarController = TextEditingController();
  final emailController = TextEditingController();

  Future<DateTime?> _showDatePicker(DateTime _dateTime) {
    return showDatePicker(context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(DateTime.now().year + 1),
    );
  }

  DateTime? _dateTime;
  void initState() {
    _dateTime = widget.person.DOB;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            fontWeight: FontWeight.w800
          ),
        ),
        leading: IconButton(
          onPressed: () {

            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: firstController,
              decoration: InputDecoration(
                hintText: "First Name: ${widget.person.first}",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    firstController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
             /* onEditingComplete: () {
                person.first = firstController.text;
              }, */
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
            ),
            SizedBox(height: 10,),
            TextField(
              controller: secondController,
              decoration: InputDecoration(
                hintText: "Last Name: ${widget.person.last}",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    secondController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
             /* onEditingComplete: () {
                person.last = secondController.text;
              }, */
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
            ),
            SizedBox(height: 10,),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email: ${widget.person.email}",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    emailController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
             /* onEditingComplete: () {
                person.email = emailController.text;
              }, */
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
            ),
            SizedBox(height: 10,),
            Expanded(
              child: TextField(
                controller: calendarController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Date of Birth: ${DateFormat('MM-dd-yyyy','en_US').format(DateTime.parse(widget.person.DOB.toString()))}",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      _dateTime = widget.person.DOB;
                      _dateTime = (await _showDatePicker(_dateTime as DateTime))!;
                      if(_dateTime != null) {
                        setState(() {
                          //person.DOB = _dateTime;
                          String date = DateFormat('MM-dd-yyyy','en_US').format(DateTime.parse(_dateTime.toString()));
                          calendarController.text = date;
                        });
                      }
                    },
                    icon: const Icon(Icons.calendar_month),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            MaterialButton(
              onPressed: () {
                setState(() {

                  print(firstController.text);

                  if(firstController.value.text != "") { widget.person.first = firstController.text; }
                  if(secondController.text != "") { widget.person.last = secondController.text; }
                  widget.person.DOB = _dateTime;
                  if(emailController.text != "") { widget.person.email = emailController.text; }
                });
                Navigator.pop(context, widget.person);
              },
              elevation: 0,
              color: Colors.blue,
              child: const Text(
                "Save Changes",
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
