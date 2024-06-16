import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/model/Auth_class.dart';
import 'package:ecommerce_app/model/secure_storage_class.dart';
import 'package:ecommerce_app/view/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
    required Auth auth,
  }) : _auth = auth;

  final Auth _auth;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await _auth.signOut();
        SecureStorage.writeIsSaved("isSaved", "notSaved");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: kColor.redColor, elevation: 0),
      child: Text(
        "LogOut",
        style: appStyle(
            fw: FontWeight.w500, size: 14.sp, color: kColor.whiteColor),
      ),
    );
  }
}
