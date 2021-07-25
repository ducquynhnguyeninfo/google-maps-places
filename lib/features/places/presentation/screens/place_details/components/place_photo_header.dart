import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:places/config/secret.dart';
import 'package:places/values/values.dart';
import 'package:places/features/places/data/datasources/remote_api/models/photo_model.dart';

class PlacePhotoHeader extends SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;
  final List<Photo> photos;
  final String placeId;

  PlacePhotoHeader(
      {this.minExtent = 0,
      required this.maxExtent,
      required this.photos,
      required this.placeId});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
          transitionOnUserGestures: true,
          tag: placeId,
          child: CarouselSlider.builder(
              itemCount: photos.length,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  // aspectRatio: 2.0,
                  // initialPage: controller.pictures.length ~/ 2,
                  onPageChanged: (index, reason) {}),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                        child: CachedNetworkImage(
                      imageUrl:
                          photos[index].photoUrl + '&key=${Secret.apiKey}',
                      fit: BoxFit.cover,
                      placeholder: (context, url) {
                        return Image.asset(assetImages + 'cafe-placeholder.png',
                            fit: BoxFit.cover);
                      },
                    ))
                  ],
                );
              }),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(PlacePhotoHeader oldDelegate) {
    return true;
  }
}
