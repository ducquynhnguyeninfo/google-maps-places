import 'package:flutter/material.dart';
import 'package:places/features/places/presentation/widgets/fab.dart';
import 'package:places/values/app_colors.dart';

class FabMenu extends StatelessWidget {
  const FabMenu(
      {Key? key,
      required this.animation,
      required this.toggle,
      this.onCheckMarkPress,
      this.onRatingPress})
      : super(key: key);

  final Animation animation;
  final Function() toggle;
  final Function()? onCheckMarkPress;
  final Function()? onRatingPress;

  @override
  Widget build(BuildContext context) {
    return ExpandedAnimationFab(
      animation: animation,
      onPress: toggle,
      fabItems: [
        FabItem(Icons.check_box_outlined, 'Check mark',
            onPress: () => onPress(onCheckMarkPress)),
        FabItem(Icons.star_rate_outlined, 'Rating',
            onPress: () => onPress(onRatingPress))
      ],
    );
  }

  void onPress(Function()? callback) {
    toggle();
    if (callback != null) callback();
  }
}

class ExpandedAnimationFab extends AnimatedWidget {
  final List<FabItem> fabItems;
  final Function()? onPress;

  Animation<double> get animation => this.listenable as Animation<double>;

  ExpandedAnimationFab(
      {required this.fabItems, required Animation animation, this.onPress})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IgnorePointer(
          ignoring: animation.value == 0,
          child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: buildItem,
              separatorBuilder: (_, __) => const SizedBox(height: 9),
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: fabItems.length),
        ),
        FloatingActionButton(
          onPressed: onPress,
          backgroundColor: AppColors.mainColor,
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: animation,
          ),
        )
      ],
    );
  }

  Widget buildItem(BuildContext context, int index) {
    final screenWith = MediaQuery.of(context).size.width;
    final transform = Matrix4.translationValues(
        -(screenWith - animation.value * screenWith) *
            ((fabItems.length - index) / 2),
        0.0,
        0.0);

    return Align(
      alignment: Alignment.centerRight,
      child: Transform(
        transform: transform,
        child: Opacity(
          opacity: animation.value,
          child: FabMenuItem(fabItems[index]),
        ),
      ),
    );
  }
}
