import 'package:flutter/material.dart';

TextStyle appStyle(
    {required FontWeight fw, required double size, Color? color}) {
  return TextStyle(
      fontFamily: "Metropolis", fontSize: size, fontWeight: fw, color: color);
}
