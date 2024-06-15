import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/model/Auth_class.dart';
import 'package:ecommerce_app/view/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _signout();
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
        ),
      ),
    );
  }

  _signout() async {
    await _auth.signOut();
  }
}
