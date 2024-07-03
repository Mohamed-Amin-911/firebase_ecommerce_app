import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/model/Auth_class.dart';
import 'package:ecommerce_app/model/secure_storage_class.dart';
import 'package:ecommerce_app/view/screens/authentication_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogOutButton extends StatefulWidget {
  const LogOutButton({
    super.key,
  });

  @override
  State<LogOutButton> createState() => _LogOutButtonState();
}

class _LogOutButtonState extends State<LogOutButton> {
  final _auth = Auth();
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
