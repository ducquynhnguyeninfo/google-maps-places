import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/values/size_config.dart';
import 'package:places/values/values.dart';
import 'package:places/features/places/domain/entities/entities.dart';
import 'package:places/features/places/presentation/screens/place_details/details_page.dart';

class ListItemView extends StatelessWidget {

  final PlaceEntity place;
  ListItemView(this.place);

  @override
  Widget build(BuildContext context) {

    var borderRadius = BorderRadius.circular(SizeConfig.default_radius);
    double imageSize = 120.0;
    return Padding(
      padding: const EdgeInsets.only(bottom: SizeConfig.default_padding),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PlaceDetailScreen(placeId: place.placeId!)));
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
                  tag: place,
                  child: ClipRRect(
                    child: (place.photo == null)
                        ? Image.asset(assetImages + 'cafe-placeholder.png')
                        : CachedNetworkImage(
                            imageUrl: place.photo!.thumbnailUrl,
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
                        Text(place.name!,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                        Text(place.formattedAddress!,
                            overflow: TextOverflow.ellipsis, maxLines: 2),
                        Text('distance 20km', overflow: TextOverflow.ellipsis),
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
