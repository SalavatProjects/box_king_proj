import 'package:box_king_proj/ui_kit/app_colors.dart';
import 'package:box_king_proj/ui_kit/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  String text;
  void Function() onPressed;

  CustomAppBar({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
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
                    onPressed: onPressed,
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
                  child: Text(text.toUpperCase(), style: AppStyles.gilroyMediumWhite(20.sp),)),
            ],
          ),
        ),
      ),
    );
  }
}
