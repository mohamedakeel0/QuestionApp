import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionapp/bloc/cubic/cubic.dart';
import 'package:questionapp/bloc/cubic/states.dart';
import 'package:questionapp/presentation/componnent/default_button_components.dart';
import 'package:questionapp/shared/resources/assets_manager.dart';
import 'package:questionapp/shared/resources/color_manager.dart';
import 'package:questionapp/shared/resources/routes_manager.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => QuestionCubic()..getQuestion(),
      child: BlocConsumer<QuestionCubic,QuestionStates>(listener: (context, state) {},
        builder: (context, state) => Scaffold(backgroundColor: ColorManager.primary,
        body:Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child:  Image(image:AssetImage(ImageAssets.logo) ,height: 250,width: 250,),),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget>[
                SizedBox(width: 120,
                  child: Text(
                    "High Score 500 Point",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style:Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                const SizedBox(height: 30,),
                ConditionalBuilder(condition: state is SuccessQuestionState, builder: (context) => defaultButton(
                  background: ColorManager.white,
                  function: () {

                    Navigator.pushReplacementNamed(context, Routes.questionAndAnswerRoute);
                  },
                  text: 'Start',
                  shape: true,
                  width: 200,
                  Textcolor: ColorManager.primary,
                  isUpperCase: false,
                  radius: 6,
                ), fallback: (context) => const Center(child: CircularProgressIndicator(),),)
              ],
            ),
          ],
        ),
      ),

      ),
    );
  }
}
