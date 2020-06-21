import 'package:flutter/material.dart';

Widget backIos(Color color, BuildContext context) => IconButton(
    icon: Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context));
