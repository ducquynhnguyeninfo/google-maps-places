import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'package:places/config/dependency_injection.dart';
import 'package:places/features/places/presentation/screens/place_details/components/place_details_content.dart';
import 'package:places/features/places/presentation/screens/place_details/components/place_photo_header.dart';
import 'package:places/features/places/presentation/screens/place_details/bloc/place_details_bloc.dart';
import 'package:places/values/app_colors.dart';

class PlaceDetailScreen extends StatefulWidget {
  final String placeId;

  const PlaceDetailScreen({Key? key, required this.placeId}) : super(key: key);

  @override
  _PlaceDetailScreenState createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  final headerHeight = 250.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlaceDetailsBloc>(
      create: (context) => PlaceDetailsBloc(sl()),
      child: Scaffold(
        body: _sliver(),
      ),
    );
  }

  _sliver() {
    return Stack(
      children: [
        BlocBuilder<PlaceDetailsBloc, PlaceDetailsState>(
          builder: (context, state) {
            if (state is PlaceDetailsInitial) {
              _loadDetails(context);
              return _buildShimmerUI();
            }

            if (state is PlaceDetailsLoading) {
              return _buildShimmerUI();
            }

            if (state is PlaceDetailsLoaded) {
              var detailsEntity = state.entity;
              return CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                      floating: true,
                      delegate: PlacePhotoHeader(
                          maxExtent: headerHeight,
                          photos: detailsEntity.photos ?? [])),
                  SliverFillRemaining(
                    fillOverscroll: true,
                    child: PlaceDetailsContent(detailsEntity),
                  )
                ],
              );
            }

            if (state is PlaceDetailsError) {
              return _buildErrorUI();
            }
            return _buildUnexpectedState();
          },
        ),
        Positioned(
          left: 16.0,
          top: 32.0,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildInitUI() {
    return Center(child: Text("init ..."));
  }

  Widget _buildEmptyUI() {
    return Center(child: Text("empty"));
  }

  Widget _buildErrorUI() {
    return Center(child: Text("error"));
  }

  Widget _buildShimmerUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Shimmer.fromColors(
            child:
                Container(height: headerHeight, color: AppColors.shimmerColor),
            baseColor: AppColors.shimmerColor,
            highlightColor: AppColors.shimmerHighlightColor),
        SizedBox(height: 10),
        Expanded(
            child: Shimmer.fromColors(
                child: Container(color: AppColors.shimmerColor),
                baseColor: AppColors.shimmerColor,
                highlightColor: AppColors.shimmerHighlightColor))
      ],
    );
  }

  Widget _buildUnexpectedState() {
    return Center(child: Text("Error: _buildUnexpectedState ..."));
  }

  void _loadDetails(BuildContext ctx) {
    BlocProvider.of<PlaceDetailsBloc>(ctx)
        .add(GetPlaceDetailsEvent(widget.placeId));
  }
}
