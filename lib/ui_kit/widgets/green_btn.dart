import 'package:box_king_proj/ui_kit/app_colors.dart';
import 'package:box_king_proj/ui_kit/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GreenBtn extends StatelessWidget {
  String text;
  void Function() onPressed;

  GreenBtn({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.w),
      child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          child: Container(
            width: 270.w,
            height: 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.green
            ),
            child: Center(
              child: Text(text.toUpperCase(), style: AppStyles.gilroyMediumBlack(20.sp),),
            ),
          )),
    );
  }
}
