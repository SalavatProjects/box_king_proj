import 'dart:async';

import 'package:box_king_proj/bloc/train_cubit.dart';
import 'package:box_king_proj/pages/training_history_page.dart';
import 'package:box_king_proj/ui_kit/app_colors.dart';
import 'package:box_king_proj/ui_kit/app_styles.dart';
import 'package:box_king_proj/ui_kit/widgets/custom_app_bar.dart';
import 'package:box_king_proj/ui_kit/widgets/green_btn.dart';
import 'package:box_king_proj/ui_kit/widgets/train_btn.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:box_king_proj/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/trains_cubit.dart';

class TrainPageView extends StatefulWidget {
  const TrainPageView({super.key});

  @override
  State<TrainPageView> createState() => _TrainPageViewState();
}

class _TrainPageViewState extends State<TrainPageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  Duration _duration = Duration.zero;
  Timer? _timer;
  bool _isRunning = false;

  void _nextPage() {
    setState(() {
      _currentPage++;
    });
    _pageController.nextPage(
      duration: AppConstants.duration200,
      curve: Curves.easeInOut,
    );
  }

  void _prevPage() {
    setState(() {
      _currentPage--;
    });
    _pageController.previousPage(
      duration: AppConstants.duration200,
      curve: Curves.easeInOut,
    );
  }

  void _startPauseTimer() {
    if (_isRunning) {
      _timer?.cancel();
    } else {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _duration = _duration + Duration(seconds: 1);
        });
        context.read<TrainCubit>().updateDuration(DateTime(0, 0, 0, 0, _duration.inMinutes, _duration.inSeconds % 60));
      });
    }
    setState(() {
      _isRunning = !_isRunning;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = "${_duration.inMinutes.toString().padLeft(2, '0')}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}";
    context.read<TrainCubit>().updateDate(DateUtils.dateOnly(DateTime.now()));
    context.read<TrainCubit>().updateDuration(DateTime(0, 0, 0, 0, _duration.inMinutes, _duration.inSeconds % 60));
    return Scaffold(
      backgroundColor: AppColors.background,
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          SafeArea(
              child:
              Column(
                children: [
                  CustomAppBar(
                    onPressed: () => Navigator.of(context).pop(),
                    text: 'train',
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 20.w, horizontal: 12.w),
                    child: ListView.builder(
                        itemCount: AppConstants.trainNames.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) =>
                            TrainBtn(
                                text: AppConstants.trainNames[index],
                                onPressed: () {
                                  _nextPage();
                                  context.read<TrainCubit>().updateName(
                                      AppConstants.trainNames[index]);
                                })
                    ),
                  )
                ],
              )
          ),
          SafeArea(
            child: Column(
              children: [
                BlocSelector<TrainCubit, TrainState, String>(
                  selector: (state) => state.name,
                  builder: (context, name) {
                    return CustomAppBar(
                      onPressed: () => _prevPage(),
                      text: name,
                    );
                  },
                ),
                BlocSelector<TrainCubit, TrainState, String>(
                selector: (state) => state.name,
                builder: (context, name) {
                  return CarouselSlider(items: AppConstants.trainTypes.map(
                    (elem) => Builder(builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Column(
                          children: [
                            Container(
                              height: 52.w,
                              width: MediaQuery.of(context).size.width,
                              color: AppColors.lightBlack2,
                              padding: EdgeInsets.all(15.w),
                              child: Text(elem.toUpperCase(), style: AppStyles.gilroyBoldGreen(20.sp),),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: AppColors.grey,
                              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.w),
                              child: Column(
                                children: [
                                  ...List.generate(
                                    AppConstants.trainsContent[name]![elem]!.length,
                                    (int index) => Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 14.w,
                                            child: Image.asset('assets/images/fire.png'),),
                                        SizedBox(width: 8.w,),
                                        Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.only(bottom: 24.w),
                                              child: Text(AppConstants.trainsContent[name]![elem]![index],
                                                style: AppStyles.gilroyMediumWhite(14.sp),),
                                            ),
                                        )
                                      ],
                                    )
                                ),
                                  GreenBtn(text: 'start', onPressed: () {
                                    _nextPage();
                                    context.read<TrainCubit>().updateType(elem);
                                  })
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    })).toList(), options: CarouselOptions(
                  height: 470.h,
                  viewportFraction: 0.9,
                ));
  },
)
              ],
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                BlocSelector<TrainCubit, TrainState, String>(
                  selector: (state) => state.type,
                  builder: (context, type) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.w),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 55.w,
                        color: AppColors.grey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: (){
                                    setState(() {
                                      _timer?.cancel();
                                      _duration = Duration.zero;
                                    });
                                    _prevPage();
                                    },
                                  child: Container(
                                    width: 36.w,
                                    height: 36.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      color: AppColors.green,
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset('assets/icons/Left arrow.svg'),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(type.toUpperCase(), style: AppStyles.gilroyBoldGreen(20.sp),)),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: SizedBox(
                      height: 129.w,
                      child: Column(
                        children: [
                          Text(formattedTime, style: AppStyles.gilroyLightWhite(100.sp),),
                          Divider(color: AppColors.lightGrey, height: 1,)
                        ],
                      ),
                  ),
                ),
                SizedBox(height: 24.w,),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                    onPressed: () => _startPauseTimer(),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightBlack2,
                      ),
                      child: _isRunning ? Icon(Icons.pause, size: 46.w, color: AppColors.lightGrey,) :
                      Align(
                        alignment: Alignment(0.1, 0),
                        child: SvgPicture.asset('assets/icons/play.svg'),
                      ),
                    ),
                ),
                SizedBox(height: 24.w,),
                SizedBox(
                  height: 220.w,
                  child: ListView(
                    children: [
                      _TrainCard(text: 'Warm-up', time: '20:00'),
                      _TrainCard(text: 'Jump rope workout', time: '10:00'),
                      _TrainCard(text: 'Interval running', time: '10:00'),
                      _TrainCard(text: 'Technique on paws with intensity', time: '10:00'),
                      _TrainCard(text: 'Circuit training with cardio', time: '15:00'),
                      _TrainCard(text: 'Light jogging or walking', time: '03:00'),
                    ],
                  ),
                ),
                Spacer(),
                BlocBuilder<TrainCubit, TrainState>(
                  builder: (context, state) {
                    return GreenBtn(text: 'finish', onPressed: () async {
                      await context.read<TrainsCubit>().addTrain(state);
                      _timer?.cancel();
                      _duration = Duration.zero;
                      if (context.mounted) {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) => TrainingHistoryPage())
                        );
                      }
                    });
                  },
                ),
                SizedBox(height: 40.w,)

              ],
            ),
          )
        ],
      ),
    );
  }
}

class _TrainCard extends StatelessWidget {
  String text;
  String time;

  _TrainCard({
    super.key,
    required this.text,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.w),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: AppColors.lightBlack,
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(text, style: AppStyles.gilroyMediumLightGrey2(20.sp),)),
            Text(time, style: AppStyles.gilroyMediumWhite(20.sp),)
          ],
        ),
      ),
    );
  }
}
