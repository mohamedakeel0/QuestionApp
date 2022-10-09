import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionapp/bloc/bloc_observer/blocObserver.dart';
import 'package:questionapp/bloc/cubic/cubic.dart';
import 'package:questionapp/bloc/cubic/states.dart';
import 'package:questionapp/shared/network/remot/dio_helper.dart';
import 'package:questionapp/shared/resources/routes_manager.dart';
import 'package:questionapp/shared/resources/theme_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => QuestionCubic()..getQuestion(),
      child: BlocConsumer<QuestionCubic, QuestionStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: getApplicationTheme(),
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.mainRoute,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

