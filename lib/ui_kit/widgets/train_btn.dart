import 'package:box_king_proj/ui_kit/app_colors.dart';
import 'package:box_king_proj/ui_kit/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrainBtn extends StatelessWidget {
  String text;
  void Function() onPressed;

  TrainBtn({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.w),
      child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 98.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.lightBlack3, width: 1),
                color: AppColors.lightBlack2
            ),
            child: Center(
              child: Text(text.toUpperCase(), style: AppStyles.gilroyMediumWhite(24.sp),
              ),
            ),
          )),
    );
  }
}
