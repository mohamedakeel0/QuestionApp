import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionapp/bloc/cubic/cubic.dart';
import 'package:questionapp/bloc/cubic/states.dart';
import 'package:questionapp/models/answer_model.dart';
import 'package:questionapp/presentation/componnent/default_button_components.dart';
import 'package:questionapp/presentation/componnent/question_component.dart';
import 'package:questionapp/shared/resources/assets_manager.dart';
import 'package:questionapp/shared/resources/color_manager.dart';
class QuestionAndAnswerScreen extends StatelessWidget {
  const QuestionAndAnswerScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionCubic, QuestionStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var boardController = PageController();
          var cubic = QuestionCubic.get(context);
       return   ConditionalBuilder(condition: cubic.questionModel!.questions!=null,builder: (context) =>    Scaffold(backgroundColor: ColorManager.primary,body: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [

              Container(
                height: 60,width: MediaQuery.of(context).size.width,color: ColorManager.white,

                child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.center,children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text:  'Question :',
                        style:  Theme.of(context).textTheme.subtitle1,),
                      TextSpan(
                        text: ' ${cubic.questionNumber}/${cubic.questionModel!.questions!.length}',
                        style: Theme.of(context).textTheme.subtitle1,)
                    ]),
                  ),
                  const SizedBox(width: 10,),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text:  'Score :',
                        style: Theme.of(context).textTheme.subtitle1,),
                      TextSpan(
                        text: '${cubic.questionModel!.questions![0].score}',
                        style: Theme.of(context).textTheme.subtitle1,)
                    ]),
                  ),
                ],),
              ),
              const SizedBox(height: 15,),
              SizedBox(height: 630,
                child: PageView.builder(itemCount: cubic.questionModel!.questions!.length,physics:const BouncingScrollPhysics(),itemBuilder: (context,index){

                 return QuestionItemComponent(question: cubic.questionModel!.questions![index]);
                }, onPageChanged: (index) {
                  if (index == cubic.questionModel!.questions!.length - 1) {
                   cubic.changePageView(true);
                  } else {
                    cubic.changePageView(false);
                  }
                  cubic.answerModel=AnswerModel(answerColor:ColorManager.white ,number: 0);
                  print(index);
                },controller: cubic.boardController,

             ),
              ),
            ],),
          ),),fallback: (context) => const Center(child: CircularProgressIndicator()),);
    }
    );

  }
}
