import 'package:contacts2/contact/add_contact.dart';
import 'package:contacts2/contact/fav.dart';
import 'package:contacts2/contact/home_screen.dart';
import 'package:contacts2/contact/ui_screen.dart';
import'package:flutter/material.dart';
void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) =>Home_Screen(),
        "add":(context) => Add_Contact(),
        "ui":(context) => Contact_UI(),
        "fav":(context) => Fav_Screen(),
      },
    ),
  );
}