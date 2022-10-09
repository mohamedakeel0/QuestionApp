import 'package:flutter/material.dart';
import 'package:questionapp/shared/resources/color_manager.dart';

Widget defaultButton({
  double width = double.infinity,
  double height = 50,
  Color background = Colors.orangeAccent,
  Color colorBorder = Colors.white,
  Color Textcolor = Colors.white,
  bool isUpperCase = true,
  double radius = 3.0,
  bool shape = true,

  bool icon = false,
  required VoidCallback? function,
  required String text,
}) =>
    Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: width,
      height: height,
      decoration: shape
          ?  BoxDecoration(
          color: background,
          border: Border.all(color: colorBorder, width: 2),
          borderRadius: BorderRadius.circular(radius))
          : ShapeDecoration(
        color: background,
        shape: const StadiumBorder(
          side: BorderSide(
            width: 2,
            color: Colors.white,
          ),
        ),
      ),
      child: MaterialButton(
          onPressed: function,
          child:icon?Row(mainAxisAlignment: MainAxisAlignment.start,children: [

            const Icon(Icons.login,color: Colors.black87,),

            Text(
              isUpperCase ? text.toUpperCase() : text,
              style: TextStyle(
                color: Textcolor,fontWeight: FontWeight.w700,fontSize: 17,
              ),
            ),],): Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(
              color: Textcolor,fontWeight:  FontWeight.w800,fontSize: 20,
            ),
          )
      ),
    );