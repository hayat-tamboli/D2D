import 'package:flutter/material.dart';
import 'package:random/Model/Project.dart';
import 'package:random/Services/projectServices.dart';
import 'package:random/widgets/button.dart';
import 'package:random/widgets/inputBox.dart';

import '../../mainApp.dart';

class AddProject extends StatefulWidget {
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController linkTextEditingController = new TextEditingController();
  TextEditingController imgTextEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Project", style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            InputBox(
              controller: nameTextEditingController,
              textInputType: TextInputType.name,
              hintText: 'Project Name',
              maxLength: 36,
            ),
            InputBox(
              controller: linkTextEditingController,
              textInputType: TextInputType.name,
              hintText: 'Project Link',
              maxLength: 36,
            ),
            InputBox(
              controller: imgTextEditingController,
              textInputType: TextInputType.name,
              hintText: 'Image Link',
              maxLength: 36,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: PrimaryButton(
                alt: false,
                onTap: () async {
                  Project p = Project.newProject(
                      nameTextEditingController.toString(),
                      linkTextEditingController.toString(),
                      imgTextEditingController.toString());
                  await addProject(p);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainApp()));
                },
                text: "Add Project",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
