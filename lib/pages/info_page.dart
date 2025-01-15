import 'package:box_king_proj/ui_kit/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:box_king_proj/ui_kit/widgets/widgets.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
          child: Stack(
            children: [
              CustomAppBar(text: 'info', onPressed: () => Navigator.of(context).pop()),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GreenBtn(text: 'description', onPressed: () {}),
                    GreenBtn(text: 'PRIVACY POLICY', onPressed: () {}),
                    GreenBtn(text: 'contact us', onPressed: () {}),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
