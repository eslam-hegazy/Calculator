import 'package:bloc/bloc.dart';
import 'package:eslamportofolio/cubit/global_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/MyBlocObserver.dart';
import 'home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.deepPurple[100],
          primarySwatch: Colors.deepPurple,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          ),
        ),
      ),
    );
  }
}
