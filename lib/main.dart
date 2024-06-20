import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/controller/provider/success_login_provider.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/view/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (context) => SuccessLogInRovider()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'eCommerce app',
              theme: ThemeData(
                chipTheme: ChipThemeData(
                    labelStyle: TextStyle(
                        color: kColor.whiteColor,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Metropolis",
                        fontSize: 14.sp)),
                inputDecorationTheme: const InputDecorationTheme(
                  labelStyle: TextStyle(color: kColor.text2Color),
                  floatingLabelStyle: TextStyle(color: kColor.text2Color),
                ),
                colorScheme: ColorScheme.fromSeed(
                  seedColor: kColor.textColor,
                ),
                useMaterial3: true,
              ),
              home: const MainScreen(),
            ),
          );
        });
  }
}
