import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/constants/icon_assets.dart';
import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/model/Auth_class.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/view/screens/authentication_screens/login_screen.dart';
import 'package:ecommerce_app/view/widgets/red_button_widget.dart';
import 'package:ecommerce_app/view/widgets/txt_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../controller/provider/upload_user_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool validator = true;
  bool nameError = false;
  bool emailError = false;
  bool passError = false;
  bool isFieldEmpty = true;
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  final _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColor.whiteColor,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 106.h, left: 14.w),
              child: Text(
                "Sign up",
                style: appStyle(
                    fw: FontWeight.w700, size: 34.sp, color: kColor.textColor),
              ),
            ),
            SizedBox(height: 73.h),

            //name text field
            TxtFieldWidget(
              controller: _nameController,
              isFieldEmpty: isFieldEmpty,
              error: nameError,
              label: "Name",
              obscureText: false,
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null) {
                  setState(() {
                    isFieldEmpty = true;
                  });
                }
                setState(() {
                  isFieldEmpty = false;
                });

                if (value == null || !RegExp(r'([a-zA-Z])').hasMatch(value)) {
                  setState(() {
                    nameError = true;
                  });
                  return 'Please enter a valid name';
                }
                setState(() {
                  nameError = false;
                });
                return null;
              },
            ),
            SizedBox(height: 8.h),

            //email text field
            TxtFieldWidget(
              controller: _emailController,
              isFieldEmpty: isFieldEmpty,
              error: emailError,
              label: "Email",
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null) {
                  setState(() {
                    isFieldEmpty = true;
                  });
                }
                setState(() {
                  isFieldEmpty = false;
                });
                if (value == null ||
                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                  setState(() {
                    emailError = true;
                  });
                  return 'Not a valid email address. Should be your@email.com';
                }
                setState(() {
                  emailError = false;
                });
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
                if (value == null) {
                  setState(() {
                    isFieldEmpty = true;
                  });
                }
                setState(() {
                  isFieldEmpty = false;
                });
                if (value == null || value.length < 8) {
                  setState(() {
                    passError = true;
                  });
                  return 'Password must be at least 8 characters';
                }
                if (!RegExp(r'[A-Z]').hasMatch(value)) {
                  setState(() {
                    passError = true;
                  });
                  return 'Password must contain a capital letter';
                }
                if (!RegExp(r'[0-9]').hasMatch(value)) {
                  setState(() {
                    passError = true;
                  });
                  return 'Password must contain a number';
                }
                if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                  setState(() {
                    passError = true;
                  });
                  return 'Password must contain a special character';
                }
                setState(() {
                  passError = false;
                });
                return null;
              },
            ),
            SizedBox(height: 16.h),

            //go to login
            Row(children: [
              const Spacer(),
              Text(
                "Already have an account?",
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

            //sign up
            RedButtonWidget(
                function: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _signUp();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Signup failed!')),
                    );
                  }
                },
                name: "SIGN UP"),
          ],
        ),
      ),
    );
  }

  _signUp() async {
    final user = await _auth.signUpWithEmailAndPassword(
        _emailController.text, _passwordController.text);
    await _auth.sendEmailVerification();
    if (user != null) {
      Provider.of<UploadUserProvider>(context, listen: false).uploadUser(Userr(
          email: _emailController.text,
          name: _nameController.text,
          password: _passwordController.text));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('email verification sent.')),
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Something went wrong.")),
      );
    }
  }
}
