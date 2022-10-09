import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionapp/bloc/cubic/cubic.dart';
import 'package:questionapp/bloc/cubic/states.dart';
import 'package:questionapp/presentation/componnent/default_button_components.dart';
import 'package:questionapp/shared/resources/color_manager.dart';
class QuestionItemComponent extends StatelessWidget {
  dynamic question;
   QuestionItemComponent({Key? key,required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<QuestionCubic, QuestionStates>(
        listener: (context, state) {},
    builder: (context, state) {
    var cubic = QuestionCubic.get(context);
     return Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
        Container(height: 380,width: 350,
          decoration: BoxDecoration(  color: ColorManager.white, borderRadius:
          BorderRadius.circular(20)),child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Text(
                "${question.score} Point",
                softWrap: true,
                textAlign: TextAlign.center,
                style:  Theme.of(context).textTheme.subtitle1,
              ),
              question.questionImageUrl==null|| question.questionImageUrl=='null' ? const Spacer():Center(child:  Image(image:NetworkImage('${question.questionImageUrl}') ,height: 250,width: 250,),),

              Text(
                question.question!,
                softWrap: true,
                textAlign: TextAlign.center,
                style:  Theme.of(context).textTheme.headline1,
              ),
            ],),
          ),
        ),
        const SizedBox(height: 30,),
        defaultButton(
          background: ColorManager.white,colorBorder: cubic.answerModel.number==1&& cubic.answerModel.number!=null? cubic.answerModel.answerColor!:ColorManager.white,
          function: () {
            cubic.changeColorAnswer('A', question.correctAnswer,1,context,question.score);

          },
          text: '${question.answers!.a}',height: 40,
          shape: true,
          width: 300,
          Textcolor: ColorManager.primary,
          isUpperCase: false,
          radius: 6,
        ),
        const SizedBox(height: 15,),
        defaultButton(
          background: ColorManager.white,colorBorder: cubic.answerModel.number==2&& cubic.answerModel.number!=null? cubic.answerModel.answerColor!:ColorManager.white,
          function: () {

            cubic.changeColorAnswer('B', question.correctAnswer,2,context,question.score);

          },
          text:  '${question.answers!.b}',height: 40,
          shape: true,
          width: 300,
          Textcolor: ColorManager.primary,
          isUpperCase: false,
          radius: 6,
        ),
        const SizedBox(height: 15,),
        defaultButton(
          background: ColorManager.white,colorBorder: cubic.answerModel.number==3&& cubic.answerModel.number!=null? cubic.answerModel.answerColor!:ColorManager.white,
          function: () {
            cubic.changeColorAnswer('C', question.correctAnswer,3,context,question.score);
          },
          text:  '${question.answers!.c}',height: 40,
          shape: true,
          width: 300,
          Textcolor: ColorManager.primary,
          isUpperCase: false,
          radius: 6,
        ),
        const SizedBox(height: 15,),

        defaultButton(
          background: ColorManager.white,colorBorder: cubic.answerModel.number==4&& cubic.answerModel.number!=null? cubic.answerModel.answerColor!:ColorManager.white,
          function: () {
            cubic.changeColorAnswer('C', question.correctAnswer,4,context,question.score);
          },
          text:  '${question.answers!.d}',height: 40,
          shape: true,
          width: 300,
          Textcolor: ColorManager.primary,
          isUpperCase: false,
          radius: 6,
        ),
      ],);}
    );
  }
}
