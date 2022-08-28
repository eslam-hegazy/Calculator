import 'package:bloc/bloc.dart';
import 'package:eslamportofolio/cubit/global_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(InitialState());
  static GlobalCubit get(context) => BlocProvider.of(context);
  bool isOperators(String x) {
    if (x == '%' || x == '/' || x == '*' || x == '-' || x == '+' || x == '=') {
      return true;
    } else {
      return false;
    }
  }

  var userQuestion = ' ';
  var userAnswer = ' ';

  void equalPress() {
    String finalQuestion = userQuestion;
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}
