


import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionapp/bloc/cubic/states.dart';
import 'package:questionapp/models/answer_map_model.dart';
import 'package:questionapp/models/answer_model.dart';
import 'package:questionapp/models/question_model.dart';

import 'package:questionapp/shared/network/remot/dio_helper.dart';
import 'package:questionapp/shared/resources/color_manager.dart';
import 'package:questionapp/shared/resources/routes_manager.dart';

class QuestionCubic extends Cubit<QuestionStates> {
  QuestionCubic() : super(QuestionInitailState());

  static QuestionCubic get(context) => BlocProvider.of(context);
  QuestionModel? questionModel;
  Map<String, dynamic>? map;
  List<AnswerMapModel> Answer=[];
  void getQuestion() async {
    emit(LoadingQuestionState());
    await DioHelper.getData(url: '/quiz.json').then((value) async {


      questionModel =await QuestionModel.fromJson(value.data) ;
      print('done');

      print('itemdetail${questionModel!.questions![0].answers.runtimeType}');
      value.data['questions']!.forEach((element) {

        map=element['answers'];
        element['answers'].forEach((key, value) {
          Answer.add(AnswerMapModel(answerLetter:key ,answerWord: value));
        });
      });
print(Answer[0].answerLetter);


      emit(SuccessQuestionState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorQuestionState(error.toString()));
    });
  }
  AnswerModel answerModel=AnswerModel(answerColor:ColorManager.white ,number: 0);
bool? isSelect;
  changeColorAnswer(answer,correctAnswer,number,context){
    print(answer);
    print(correctAnswer);
if(answer ==correctAnswer){
  answerModel=AnswerModel(answerColor:ColorManager.green ,number: number);
  goNextPage(context);
  changeQuestionNumber();
  emit(ChangeColorAnswerState());
}else if(answer !=correctAnswer){
  answerModel=AnswerModel(answerColor:ColorManager.error ,number: number);
  goNextPage(context);

  emit(ChangeColorAnswerState());

}else{
  answerModel=AnswerModel(answerColor:ColorManager.white ,number: number);
  emit(ChangeColorAnswerState());

}
  }
  int questionNumber=0;
  changeQuestionNumber(){
    questionNumber++;
    emit(QuestionNumberState());
  }
  bool islast = false;
changePageView(last){
  islast = last;
  emit(LastPageViewState());
}
  var boardController = PageController();
goNextPage(context){
  if (islast) {
    Navigator.pushReplacementNamed(context, Routes.mainRoute);
    emit(GoNextPageState());
  } else {

    boardController.nextPage(
        duration: const Duration(seconds: 6),
        curve: Curves.fastLinearToSlowEaseIn);
    emit(GoNextPageState());
  }
}
}