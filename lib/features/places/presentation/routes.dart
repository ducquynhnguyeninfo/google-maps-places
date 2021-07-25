import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/features/places/presentation/screens/direction_map/location_map_page.dart';
import 'package:places/features/places/presentation/screens/place_details/details_page.dart';
import 'package:places/features/places/presentation/screens/places_list/home_page.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePage.name:
      return makeMaterialPageRoute((context) => HomePage(), settings);

    case PlaceDetailScreen.name:
      return makeMaterialPageRoute((context) => PlaceDetailScreen(), settings);

    case LocationMapPage.name:
      return makeMaterialPageRoute((context) => LocationMapPage(), settings);

    default:
      return makeMaterialPageRoute((context) => HomePage(), settings);
  }
}

Route makeMaterialPageRoute(WidgetBuilder builder, RouteSettings settings) =>
    CupertinoPageRoute(builder: builder, settings: settings);
