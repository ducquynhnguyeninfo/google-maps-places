import 'dart:math';
import 'package:flutter/material.dart';
import 'package:places/values/values.dart';
import 'package:places/features/places/domain/entities/entities.dart';

class PlacePhotoHeader extends SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;
  final List<PhotoEntity> photos;

  PlacePhotoHeader({this.minExtent = 0, required this.maxExtent, required this.photos});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
          transitionOnUserGestures: true,
          tag: photos,
          child: Image.asset(
            assetImages + 'cafe-placeholder.png',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black54],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Positioned(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
          child: Text(
            'Lorem ipsum',
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.white.withOpacity(titleOpacity(shrinkOffset)),
            ),
          ),
        ),

      ],
    );
  }

  double titleOpacity(double shrinkOffset) {
    // simple formula: fade out text as soon as shrinkOffset > 0
    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
    // more complex formula: starts fading out text when shrinkOffset > minExtent
    //return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  @override
  bool shouldRebuild(PlacePhotoHeader oldDelegate) {
    return true;
  }
}
