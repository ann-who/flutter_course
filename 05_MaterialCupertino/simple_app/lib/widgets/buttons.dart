import 'package:flutter/material.dart';
import 'package:simple_app/resources/app_colors.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;

  AppTextButton({
    Key? key,
    this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(color: AppColors.text),
      ),
      style: TextButton.styleFrom(
        backgroundColor: AppColors.backgroundButton,
      ),
    );
  }
}
