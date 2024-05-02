import 'package:flutter/material.dart';
import 'package:totalx_machine_task/service/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  AuthService authService = AuthService();
  signinWithPhone(
      {
      required String phoneNumber,
      required BuildContext context}) async {
    try {
      await authService.signinWithPhone(
           phoneNumber: phoneNumber, context: context);
    } catch (e) {
      throw Exception('Phone auth interrupted$e');
    }
    notifyListeners();
  }

  verifyOtp(
      {required String verificationId,
      required String otp,
      required Function onSuccess,
      required String phone}) {
    try {
      authService.verifyOtp(
          verificationId: verificationId,
          otp: otp,
          onSuccess: onSuccess,
          phone: phone);
    } catch (e) {
      throw Exception('otp verification interrupted because$e');
    }
    notifyListeners();
  }
}
