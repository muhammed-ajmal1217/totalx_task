import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:totalx_machine_task/model/user_data_model.dart';
import 'package:totalx_machine_task/service/data_service.dart';

class AddDialogueBox extends StatelessWidget {
  const AddDialogueBox({
    super.key,
    required this.nameController,
    required this.phoneController,
  });

  final TextEditingController nameController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add a new Users',
                style: GoogleFonts.montserrat(
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      AssetImage('assets/Group 18796.png'),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Name',
                style: GoogleFonts.montserrat(),
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  hintStyle:
                      GoogleFonts.montserrat(color: Colors.grey[400]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: 10),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Age',
                style: GoogleFonts.montserrat(),
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: 'Enter your phone number',
                  hintStyle:
                      GoogleFonts.montserrat(color: Colors.grey[400]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: 10),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 90,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        'Cancel',
                        style: GoogleFonts.montserrat(
                            color: Colors.black),
                      )),
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      UserDataModel users = UserDataModel(
                        name: nameController.text,
                        phoneNumber: phoneController.text,
                        image: '',
                        time: Timestamp.now()
                      );
                      DataService().addUserCollection(users);
                      Navigator.pop(context);
                      nameController.clear();
                      phoneController.clear();
                    },
                    child: Container(
                      width: 90,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        'Save',
                        style: GoogleFonts.montserrat(
                            color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}