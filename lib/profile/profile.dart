import 'package:flutter/material.dart';
import 'package:test_project/profile/ProfileEditor.dart';
import 'package:test_project/profile/showInfo.dart';
import 'package:test_project/classes/person.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:test_project/profile/updateHealthInfo.dart';

class Profile extends StatefulWidget {

  HealthInfo healthInfo = HealthInfo();
  //Profile({required Key key, required Person person}) : super(key: key);
  Profile({super.key, required this.healthInfo});




  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      resizeToAvoidBottomInset: false,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
              child: Center(
                child: CircularProfileAvatar(
                  '',
                  child: Image.asset('assets/kian.jpg', width: 100.0, height: 100.0, ),
                  borderColor: Colors.purpleAccent,
                  borderWidth: 2,
                  elevation: 2,
                  radius: 75,
                ),
              ),
            ),
            const SizedBox(height: 6,),
            Text(
              "${widget.healthInfo.basicInfo.first} ${widget.healthInfo.basicInfo.last}",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(height: 6,),
            Text(
              "${widget.healthInfo.basicInfo.email}"
            ),
            const SizedBox(height: 15,),

            ElevatedButton.icon(

              onPressed: () async {
                Person temp = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileEditor(person: widget.healthInfo.basicInfo)
                    )
                );
                setState(() {
                  widget.healthInfo.basicInfo = temp;
                });

              },
              label: const Text("Edit Profile"),
              icon: const Icon(Icons.edit),
            ),

            //const SizedBox(height: 10,),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowInfo(healthInfo: widget.healthInfo,)
                    )
                  );
                },
                icon: const Icon(Icons.medical_information),
                label: const Text("Show Information"),
            ),

            ElevatedButton.icon(

              onPressed: () async {
                widget.healthInfo.basicInfo = widget.healthInfo.basicInfo;
                widget.healthInfo.diagnosis = ["fat", "lazy", "big chole"];

                Person temp = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdateHealthInfo(healthInfo: widget.healthInfo)
                    )
                );
                setState(() {
                  widget.healthInfo.basicInfo = temp;
                });

              },
              label: const Text("Update Health Information"),
              icon: const Icon(Icons.medical_information),
            ),

            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
