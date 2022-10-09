

import 'package:flutter/material.dart';

import 'package:questionapp/shared/resources/color_manager.dart';

ThemeData getApplicationTheme(){
  return ThemeData(tabBarTheme:const TabBarTheme(indicator:  BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: Colors.white,
        width: 2.0,
      ),
    ),
  ),labelPadding:EdgeInsets.only(left: 8) ,
  ),
//main colors
primaryColor: ColorManager.primary,

    splashColor: ColorManager.primary,
    //cardview theme
    cardTheme: CardTheme(color: ColorManager.white,shadowColor: ColorManager.grey,elevation: 5),
    //app bar theme
appBarTheme: AppBarTheme(
  centerTitle: true,
  color: ColorManager.white,elevation: 0,
  shadowColor: ColorManager.primary,

),
    //button theme
buttonTheme: ButtonThemeData(shape: const StadiumBorder(),
  disabledColor: ColorManager.grey1,buttonColor: ColorManager.primary,splashColor: ColorManager.lightPrimary,
),


      //text theme

  textTheme:  TextTheme(subtitle2:const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
    color: Colors.white,),
   subtitle1: TextStyle(
     fontSize: 20,
     color: ColorManager.primary,
     fontWeight: FontWeight.w600,
     letterSpacing: 0.15,
   ),headline1: TextStyle(
      fontSize: 22,
      color: ColorManager.primary,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
    ),
  ),

  );
}