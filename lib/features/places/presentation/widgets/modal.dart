import 'package:flutter/material.dart';
import 'package:places/values/app_colors.dart';
import 'package:places/core/extensions.dart';

class Modal extends StatelessWidget {
  static const Radius _borderRadius = Radius.circular(30.0);

  const Modal({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 14),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.only(
          topLeft: _borderRadius,
          topRight: _borderRadius,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _DragLine(),
          _Title(title),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _DragLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = context.screenSize.width * 0.2;

    return Container(
      width: width,
      height: 5,
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColors.mainColor,
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: 18, bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
