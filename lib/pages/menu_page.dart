import 'package:box_king_proj/bloc/train_cubit.dart';
import 'package:box_king_proj/pages/info_page.dart';
import 'package:box_king_proj/pages/train_page_view.dart';
import 'package:box_king_proj/pages/training_history_page.dart';
import 'package:box_king_proj/ui_kit/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:box_king_proj/ui_kit/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GreenBtn(text: 'train',
                  onPressed: () =>
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) =>
                              BlocProvider(
                                create: (context) => TrainCubit(),
                                child: TrainPageView(),
                              )
                          )
                      )
              ),
              GreenBtn(
                  text: 'Training history', onPressed: () =>
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (BuildContext context) => TrainingHistoryPage()
                      )
                  )),
              GreenBtn(text: 'Info', onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) =>
                      InfoPage()
                  )
              )),
              GreenBtn(text: 'Exit', onPressed: () {}),
            ],
          )),
    );
  }
}
