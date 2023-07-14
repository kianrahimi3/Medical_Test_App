import 'package:flutter/material.dart';
import 'package:test_project/classes/person.dart';

class UpdateHealthInfo extends StatefulWidget {

  HealthInfo healthInfo = HealthInfo();
  UpdateHealthInfo({super.key, required this.healthInfo});

  @override
  State<UpdateHealthInfo> createState() => _UpdateHealthInfoState();
}

class _UpdateHealthInfoState extends State<UpdateHealthInfo> {

  final bmiController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Update Health Information",
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
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: bmiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "BMI",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    bmiController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
              onEditingComplete: () {
                widget.healthInfo.bmi = int.parse(bmiController.text);
              },
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
