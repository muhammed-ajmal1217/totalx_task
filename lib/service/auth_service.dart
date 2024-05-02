import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:totalx_machine_task/model/user_model.dart';
import 'package:totalx_machine_task/views/otp_screen.dart';

 class  AuthService{
  FirebaseAuth authentication = FirebaseAuth.instance;
  FirebaseFirestore firestore =FirebaseFirestore.instance;
    signinWithPhone(
      {
      required String phoneNumber,
      required BuildContext context}) async {
    try {
      await authentication.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {
              await authentication.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          throw Exception(error);
        },
        codeSent: (verificationId, forceResendingToken) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OtpScreen(
              verificationId: verificationId,
              phoneNumber: phoneNumber ,
            ),
          ));
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      throw Exception('Phone auth is interrupted$e');
    }
  }

  verifyOtp(
      {required String verificationId,
      required String otp,
      required String phone,
      required Function onSuccess}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      User? user = (await authentication.signInWithCredential(credential)).user;

      if (user != null) {
       UserModel userData= UserModel(id: user.uid,phoneNumber: phone);
        firestore.collection('users').doc(user.uid).set(userData.toJson());
        onSuccess();
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }
}