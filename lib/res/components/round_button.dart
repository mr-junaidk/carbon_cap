import 'package:flutter/material.dart';
import 'package:internship_task/res/color.dart';

class RoundButton extends StatelessWidget {

  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton({super.key, required this.title, this.loading = false, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 57,
        width: 257,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: loading? CircularProgressIndicator(color: AppColors.whiteColor,) : Text(title,
            style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins Bold',
                color: AppColors.whiteColor),
          ),
        ),
      ),
      onTap: onPress,
    );
  }
}
