

import 'package:flutter/material.dart';
import 'package:questionapp/presentation/screen/main_screen.dart';
import 'package:questionapp/presentation/screen/question_answer_screen.dart';
import 'package:questionapp/shared/resources/string_manager.dart';

class Routes{
  static const String mainRoute ='/main';
  static const String questionAndAnswerRoute ='/questionAndAnswer';


}
class RouteGenerator{
 static Route<dynamic>  getRoute(RouteSettings settings){
switch(settings.name){
  case Routes.mainRoute:
    return MaterialPageRoute(builder: (_)=>const MainScreen());
  case Routes.questionAndAnswerRoute:
    return MaterialPageRoute(builder: (_)=>const QuestionAndAnswerScreen());


  default:
    return unDefinedRoute();
}
  }
  static Route<dynamic>unDefinedRoute(){
   return MaterialPageRoute(builder: (_)=>Scaffold(
     appBar: AppBar(title:const Text(AppStrings.noRoutefound),),body:const Center(child: Text(AppStrings.noRoutefound),),
   ));
  }
}