import 'package:flutter/material.dart';
import 'package:places/values/app_colors.dart';

class TagView extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const TagView({Key? key, this.onTap, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
          backgroundColor: AppColors.mainColor,
          shape: StadiumBorder()),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(fontSize: 12, color: Colors.white),
      ),
    );
  }
}
