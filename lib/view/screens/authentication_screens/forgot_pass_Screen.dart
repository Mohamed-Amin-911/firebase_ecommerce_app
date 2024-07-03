import 'package:ecommerce_app/constants/text_style.dart';
import 'package:ecommerce_app/model/Auth_class.dart';
import 'package:ecommerce_app/view/screens/authentication_screens/login_screen.dart';
import 'package:ecommerce_app/view/widgets/red_button_widget.dart';
import 'package:ecommerce_app/view/widgets/txt_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/constants/colors.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  bool validator = true;

  bool numberError = false;

  bool isFieldEmpty = true;
  // final _user = FirebaseAuth.instance;
  final _auth = Auth();
  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
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
                            builder: (context) => const LoginScreen()));
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded,
                      color: kColor.textColor)),
              Padding(
                padding: EdgeInsets.only(top: 34.h, left: 14.w),
                child: Text(
                  "Forgot password",
                  style: appStyle(
                      fw: FontWeight.w700,
                      size: 34.sp,
                      color: kColor.textColor),
                ),
              ),
              SizedBox(height: 87.h),
              Padding(
                padding: EdgeInsets.only(left: 17.w, right: 17.w),
                child: Text(
                  "Please, enter your email address. You will receive a link to create a new password via email.",
                  style: appStyle(
                      fw: FontWeight.w500,
                      size: 13.sp,
                      color: kColor.textColor),
                ),
              ),
              SizedBox(height: 32.h),
              TxtFieldWidget(
                controller: _emailController,
                isFieldEmpty: isFieldEmpty,
                error: numberError,
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
                      numberError = true;
                    });
                    return 'Not a valid email address. Should be your@email.com';
                  }
                  setState(() {
                    numberError = false;
                  });
                  return null;
                },
              ),
              SizedBox(height: 55.h),
              RedButtonWidget(
                  function: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final bool checkIfEmailExistss =
                          await checkIfEmailExists(_emailController.text);

                      if (checkIfEmailExistss) {
                        await _auth.sendPasswordReset(_emailController.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Check your inbox!')),
                        );
                        Navigator.pop(context);
                      } else {
                        setState(() {
                          isFieldEmpty = false;
                        });
                        setState(() {
                          numberError = true;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('User not found!')),
                        );
                      }
                    }
                  },
                  name: "SEND"),
            ],
          )),
    );
  }

  Future<bool> checkIfEmailExists(String email) async {
    try {
      // Attempt to create a new user with the given email and a dummy password
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: 'dummyPassword123');
      // If successful, delete the user immediately
      User? user = FirebaseAuth.instance.currentUser;
      await user?.delete();
      return false; // Email did not exist before
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return true; // Email exists
      } else {
        throw e; // Re-throw other errors
      }
    }
  }
}
