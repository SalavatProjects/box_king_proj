import 'package:box_king_proj/bloc/train_cubit.dart';
import 'package:box_king_proj/bloc/trains_cubit.dart';
import 'package:box_king_proj/pages/menu_page.dart';
import 'package:box_king_proj/ui_kit/app_colors.dart';
import 'package:box_king_proj/ui_kit/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:box_king_proj/ui_kit/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TrainingHistoryPage extends StatelessWidget {
  const TrainingHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
          child: Column(
            children: [
              CustomAppBar(text: 'Training history', onPressed: () =>
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (BuildContext context) => MenuPage()
                      )
                  ),
              ),
              Expanded(
                child: SingleChildScrollView(
                    child: BlocSelector<TrainsCubit,
                        TrainsState,
                        List<TrainState>>(
                      selector: (state) => state.trains,
                      builder: (context, trains) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Column(
                            children: List.generate(
                                trains.length,
                                    (int index) =>
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.w),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
                                color: AppColors.grey,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          trains[index].name,
                                          style: AppStyles.gilroyMediumWhite(12.sp),
                                        ),
                                        Text(trains[index].type, style: AppStyles.gilroySemiBoldGreen(13.sp),),
                                        Text(DateFormat('yy.MM.dd').format(trains[index].date!), style: AppStyles.gilroyRegularWhite(12.sp),)
                                      ],
                                    ),
                                    SizedBox(
                                      width: 70.w,
                                      height: 16.w,
                                      child: Row(
                                        children: [
                                          Image.asset('assets/images/clock.png'),
                                          SizedBox(width: 8.w,),
                                          Text('${trains[index].duration!.minute.toString().padLeft(2, '0')} min',
                                          style: AppStyles.gilroyMediumWhite(13.sp),),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                          ),
                        );
                      },
                    )
                ),
              )
            ],
          )
      ),
    );
  }
}
