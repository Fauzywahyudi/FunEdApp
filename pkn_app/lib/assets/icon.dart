import 'package:flutter/material.dart';

Widget backIos(Color color, BuildContext context) => IconButton(
  tooltip: "Back",
    icon: Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context));
