import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/config/secret.dart';
import 'package:places/features/places/data/datasources/remote_api/models/place_viewmodel.dart';
import 'package:places/values/size_config.dart';
import 'package:places/values/values.dart';
import 'package:places/features/places/presentation/screens/place_details/details_page.dart';

class ListItemView extends StatelessWidget {
  final PlaceViewModel place;

  ListItemView(this.place);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(SizeConfig.default_radius);
    double imageSize = 120.0;
    return Padding(
      padding: const EdgeInsets.only(bottom: SizeConfig.default_padding),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(PlaceDetailScreen.name,
              arguments: {PlaceDetailScreen.place_id: place.placeId});
        },
        child: Material(
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          child: Container(
            padding: const EdgeInsets.all(SizeConfig.default_padding / 2),
            decoration: BoxDecoration(
              borderRadius: borderRadius,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: place.placeId,
                  child: ClipRRect(
                    child: (place.photoUrl == null)
                        ? Image.asset(assetImages + 'cafe-placeholder.png')
                        : CachedNetworkImage(
                            imageUrl: place.photoUrl +
                                '&key=${Secret.apiKey}',
                            width: imageSize,
                            height: imageSize,
                            fit: BoxFit.cover,
                            placeholder: (context, url) {
                              return Image.asset(
                                  assetImages + 'cafe-placeholder.png');
                            },
                          ),
                    borderRadius: borderRadius,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: imageSize,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(place.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                        Text(place.address,
                            overflow: TextOverflow.ellipsis, maxLines: 2),
                        Text(place.distance.text,
                            overflow: TextOverflow.ellipsis, maxLines: 1),
                        // DistanceView(place: place)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
