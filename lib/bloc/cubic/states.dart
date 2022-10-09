
import 'package:questionapp/models/question_model.dart';

abstract class QuestionStates{}
class QuestionInitailState extends QuestionStates{}

class LoadingQuestionState extends QuestionStates{}
class SuccessQuestionState extends QuestionStates{
}
class ErrorQuestionState extends QuestionStates{
  final String error;
  ErrorQuestionState(this.error);
}
class ChangeColorAnswerState extends QuestionStates{}
class ListDOneState extends QuestionStates{}
class LastPageViewState extends QuestionStates{}
class QuestionNumberState extends QuestionStates{}
class GoNextPageState extends QuestionStates{}
