import 'package:flutter/material.dart';

class TColors{
TColors._();


static const Color primary=Colors.lightBlue;
static const Color secondary=Colors.yellow;
static const Color accent=Color.fromARGB(255, 180, 213, 240);


//text Color

static const Color textPrimary=Colors.grey;
static const Color textSecondary=Color.fromARGB(124, 130, 126, 126);
static const Color textWhite=Colors.white;

//backgroundColor
static const Color light=Colors.white;
static const Color dark=Colors.black;
static const Color primaryBackground=Colors.white;

//background container color
static const Color lightContainer=Colors.white;
static  Color darkContainer=TColors.white.withOpacity(.1);

//button color
static const Color buttonPrimary=Colors.blue;
static const Color buttonSecondary=Colors.grey;
static const Color buttonDisabled=Colors.white70;

//Border color
static const Color borderPrimary=Colors.white;
static const Color borderSecondary=Colors.white;

//Error and Validation Colors
static const Color error=Colors.red;
static const Color successful=Colors.green;
static const Color warning=Colors.orange;
static const Color info=Colors.blue;

//Neutral shades
static const Color black=Colors.black;
static const Color darkergrey=Color.fromARGB(255, 91, 90, 90);
static const Color darkgrey=Color.fromARGB(255, 63, 62, 62);
static const Color grey=Colors.grey;
static const Color softgrey=Color.fromARGB(255, 191, 190, 190);
static const Color lightgrey=Color.fromARGB(255, 207, 207, 207);
static const Color white=Colors.white;

//gradient
static const Gradient lineargradient = LinearGradient(
  begin: Alignment(0.0, 0.0),
  end: Alignment(0.707,-0.707 ),
colors: [
  Colors.red,
  Color.fromARGB(255, 244, 84, 72),
    Color.fromARGB(255, 247, 133, 125),

]);










}