import 'package:ecommerce_app/constants/icon_assets.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/model/Auth_class.dart';
import 'package:ecommerce_app/model/secure_Storage_class.dart';
import 'package:ecommerce_app/view/screens/signup_screen.dart';
import 'package:ecommerce_app/view/screens/tabs_screen.dart';
import 'package:ecommerce_app/view/widgets/red_button_widget.dart';
import 'package:ecommerce_app/view/widgets/txt_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool validator = true;
  bool nameError = false;
  bool passError = false;
  bool isFieldEmpty = true;
  final _auth = Auth();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen()));
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: kColor.textColor)),
            Padding(
              padding: EdgeInsets.only(top: 34.h, left: 14.w),
              child: Text(
                "Login",
                style: appStyle(
                    fw: FontWeight.w700, size: 34.sp, color: kColor.textColor),
              ),
            ),
            SizedBox(height: 73.h),

            //email text field
            TxtFieldWidget(
              controller: _emailController,
              isFieldEmpty: isFieldEmpty,
              error: nameError,
              label: "Email",
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (nameError == false) {
                  setState(() {
                    isFieldEmpty = false;
                  });
                }
                setState(() {
                  isFieldEmpty = true;
                });
                // if (value == null ||
                //     !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                //         .hasMatch(value) ||
                //     value.length < 11 ||
                //     value.length > 11) {
                //   setState(() {
                //     numberError = true;
                //   });
                //   return 'Not a valid email address. Should be your@email.com';
                // }
                // setState(() {
                //   numberError = false;
                // });
                return null;
              },
            ),
            SizedBox(height: 8.h),

            ////pass text field
            TxtFieldWidget(
              controller: _passwordController,
              isFieldEmpty: isFieldEmpty,
              error: passError,
              label: "Password",
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (passError == false) {
                  setState(() {
                    isFieldEmpty = false;
                  });
                }
                setState(() {
                  isFieldEmpty = true;
                });
                // if (value == null || value.length < 8) {
                //   setState(() {
                //     passError = true;
                //   });
                //   return 'Password must be at least 8 characters';
                // }
                // if (!RegExp(r'[A-Z]').hasMatch(value)) {
                //   setState(() {
                //     passError = true;
                //   });
                //   return 'Password must contain a capital letter';
                // }
                // if (!RegExp(r'[0-9]').hasMatch(value)) {
                //   setState(() {
                //     passError = true;
                //   });
                //   return 'Password must contain a number';
                // }
                // if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                //   setState(() {
                //     passError = true;
                //   });
                //   return 'Password must contain a special character';
                // }
                // setState(() {
                //   passError = false;
                // });
                return null;
              },
            ),
            SizedBox(height: 16.h),

            //forgot pass
            Row(children: [
              const Spacer(),
              Text(
                "Forgot your password?",
                style: appStyle(
                    fw: FontWeight.w500, size: 14, color: kColor.textColor),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                icon: SvgPicture.asset(
                  IconAssets.rightArrow.toString(),
                  colorFilter:
                      const ColorFilter.mode(kColor.redColor, BlendMode.srcIn),
                ),
              ),
              SizedBox(width: 16.w),
            ]),
            SizedBox(height: 42.h),

            //login
            RedButtonWidget(
                function: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _logIn();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('invalid credentials!')),
                    );
                  }
                },
                name: "LOGIN"),
          ],
        ),
      ),
    );
  }

//login function
  _logIn() async {
    final user = await _auth.logInWithEmailAndPassword(
        _emailController.text, _passwordController.text);

    if (user != null) {
      nameError = false;
      passError = false;
      if (user.emailVerified == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User logged in.')),
        );
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TabsScreen()));
        SecureStorage.writeIsSaved("isSaved", "saved");
      } else if (user.emailVerified == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('email is not verified.')),
        );
        SecureStorage.writeIsSaved("isSaved", "notSaved");
      }
    } else if (user == null) {
      nameError = true;
      passError = true;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('invalid credentials!')),
      );
      SecureStorage.writeIsSaved("isSaved", "notSaved");
    }
  }
}
