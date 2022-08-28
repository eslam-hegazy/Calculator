import 'package:eslamportofolio/constants/app_color.dart';
import 'package:eslamportofolio/cubit/global_cubit.dart';
import 'package:eslamportofolio/cubit/global_state.dart';
import 'package:eslamportofolio/widget/myButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileScreen extends StatefulWidget {
  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
        builder: (context, state) {
          var cubit = GlobalCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text("Calculator"),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            cubit.userQuestion,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            child: Text(cubit.userAnswer)),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemCount: buttons.length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return MyButton(
                            title: buttons[index],
                            textColor: Colors.white,
                            color: Colors.blue,
                            onPress: () {
                              setState(() {
                                cubit.userQuestion = '';
                              });
                            },
                          );
                        } else if (index == 1) {
                          return MyButton(
                            title: buttons[index],
                            textColor: Colors.white,
                            color: Colors.red,
                            onPress: () {
                              setState(() {
                                cubit.userQuestion = cubit.userQuestion
                                    .substring(
                                        0, cubit.userQuestion.length - 1);
                              });
                            },
                          );
                        } else if (index == buttons.length - 1) {
                          return MyButton(
                            title: buttons[index],
                            textColor: Colors.white,
                            color: Colors.black,
                            onPress: () {
                              setState(() {
                                cubit.equalPress();
                              });
                            },
                          );
                        } else {
                          return MyButton(
                            title: buttons[index],
                            textColor: cubit.isOperators(buttons[index])
                                ? Colors.white
                                : Colors.black,
                            color: cubit.isOperators(buttons[index])
                                ? AppColor.kMainColor
                                : Colors.white,
                            onPress: () {
                              setState(() {
                                cubit.userQuestion += buttons[index];
                              });
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
