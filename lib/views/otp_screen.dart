import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:totalx_machine_task/controller/auth_provider.dart';
import 'package:totalx_machine_task/views/home_page.dart';

class OtpScreen extends StatelessWidget {
  String verificationId;
  String phoneNumber;

  OtpScreen({super.key,required this.verificationId,required this.phoneNumber});

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
        var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: size.height*0.23,
                    width: size.width*0.36,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Group.png'))),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'OTP Verification',
                      style: GoogleFonts.montserrat(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      'Enter the verification code we just sent to your number +91 *******21.'),
                  SizedBox(height: 10,),
                  Center(
                  child: Pinput(
                    controller: otpController,
                    length: 6,
                    defaultPinTheme: PinTheme(
                        height: 60,
                        width: 60,
                        textStyle: TextStyle(fontSize: 17, color: Colors.red),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                     verifyOtp(context, otpController.text,phoneNumber);
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Text(
                        'Verify',
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      )),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("Don't Get OTP? Resend")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

    void verifyOtp(context, String userotp,String phonenumber) {
    final authPro=Provider.of<AuthProvider>(context,listen: false);
    authPro.verifyOtp(
        verificationId: verificationId,
        otp: userotp,
        phone: phonenumber,
        onSuccess: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
        });
  }
}