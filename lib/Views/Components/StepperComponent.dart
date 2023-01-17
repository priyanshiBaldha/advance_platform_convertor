import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class StepperComponent extends StatefulWidget {
  const StepperComponent({Key? key}) : super(key: key);

  @override
  State<StepperComponent> createState() => _StepperComponentState();
}

class _StepperComponentState extends State<StepperComponent> {

  File? _image;
  ImagePicker pick = ImagePicker();



  getImageFromGallary() async {
    XFile? xfile = await pick.pickImage(source: ImageSource.gallery);
    String path = xfile!.path;
    setState(() {
      _image = File(path);
    });
  }




  int initialStep = 0;
  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: initialStep,
      onStepContinue: (){
        setState(() {
          if(initialStep < 2) {
            ++initialStep;
          }}

        );
      },
      onStepCancel: (){
        setState(() {
          if(initialStep>0){
            --initialStep;
          }
        });
      },
      onStepTapped: (val){
        setState(() {
          initialStep= val;
        });
      },
      steps: [
        Step(
          isActive: (initialStep>=0)?true:false,
          state: StepState.indexed,

          title: Text("PROFILE PHOTO"),
          subtitle: Text("Add profile photo"),
          content: Stack(alignment: Alignment(1,1),
          children: [
            (_image != null)
                ? CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[400],
              backgroundImage:
              (_image != null) ? FileImage(_image!) : null,
            )
                : CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade300,
                child: Image.asset("assets/images/profile.png")),
            InkWell(
              onTap: () {
                getImageFromGallary();
              },
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],),
        ),
        Step(
          isActive: (initialStep>=1)?true:false,
          title: Text("NAME"),
          subtitle: Text("Enter name"),
          content: TextField(
            decoration: InputDecoration(
              hintText: "Priyanshi Baldha",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Step(
          isActive: (initialStep>=2)?true:false,
          title: Text("DISCRIPTION"),
          subtitle: Text("Enter discription"),
          content: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Welcome Platform Converter App",
            ),
          ),
        ),
      ],

    );
  }
}