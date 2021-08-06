import 'package:flutter/material.dart';
import 'package:places/values/app_colors.dart';

class FabItem {
  final IconData icon;
  final String title;
  final Function()? onPress;

  FabItem(this.icon, this.title, {this.onPress});
}

class FabMenuItem extends StatelessWidget {
  final FabItem item;

  const FabMenuItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const StadiumBorder(),
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 24, right: 16),
      onPressed: item.onPress,
      color: Colors.white,
      splashColor: Colors.grey.withOpacity(0.1),
      highlightColor: Colors.grey.withOpacity(0.1),
      elevation: 2,
      highlightElevation: 2,
      disabledColor: Colors.grey,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(item.title),
          SizedBox(width: 8),
          Icon(item.icon, color: AppColors.mainColor)
        ],
      ),
    );
  }
}
