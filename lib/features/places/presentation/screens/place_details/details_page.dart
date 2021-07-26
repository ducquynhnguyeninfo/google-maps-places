import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/features/places/presentation/modals/checkmark_modal.dart';
import 'package:places/features/places/presentation/screens/place_details/components/checklist/bloc/checklist_bloc.dart';
import 'package:places/features/places/presentation/widgets/fab_menu.dart';
import 'package:places/values/values.dart';
import 'package:shimmer/shimmer.dart';

import 'package:places/config/dependency_injection.dart';
import 'package:places/features/places/presentation/screens/place_details/components/place_details_content.dart';
import 'package:places/features/places/presentation/screens/place_details/components/place_photo_header.dart';
import 'package:places/features/places/presentation/screens/place_details/bloc/place_details_bloc.dart';
import 'package:places/values/app_colors.dart';

class PlaceDetailScreen extends StatefulWidget {
  static const String name = "details_page";
  static const String place_id = "place_id";

  const PlaceDetailScreen({Key? key}) : super(key: key);

  @override
  _PlaceDetailScreenState createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen>
    with SingleTickerProviderStateMixin {
  final headerHeight = 250.0;
  late String placeId;

  // created the ScaffoldState key
  final scaffoldState = GlobalKey<ScaffoldState>();

  late Animation<double> _fabAnimation;
  late AnimationController _fabAnimationController;
  bool _isFabMenuVisible = false;

  @override
  void initState() {
    _fabAnimationController =
        AnimationController(vsync: this, duration: animationDuration);
    _fabAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        curve: Curves.easeInOut, parent: _fabAnimationController));

    super.initState();
  }

  @override
  void dispose() {
    _fabAnimationController.dispose();
    super.dispose();
  }

  void _toggleFabMenu() {
    _isFabMenuVisible = !_isFabMenuVisible;
    if (_isFabMenuVisible) {
      _fabAnimationController.forward();
    } else {
      _fabAnimationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    var arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    placeId = arguments[PlaceDetailScreen.place_id]!;

    return MultiBlocProvider(
      providers: [
        BlocProvider<PlaceDetailsBloc>(
          create: (context) => sl<PlaceDetailsBloc>(),
        ),
        BlocProvider<ChecklistBloc>(
          create: (context) => ChecklistBloc(sl(), sl()),
        ),
      ],
      child: Scaffold(
        key: scaffoldState,
        body: _sliver(),
        // resizeToAvoidBottomInset: true,
        floatingActionButton: FabMenu(
          animation: _fabAnimation,
          toggle: _toggleFabMenu,
          onCheckMarkPress: _showCheckMarkModal,
          onRatingPress: _showRatingModal,
        ),
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
              var detailsEntity = state.detail;
              return CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                      floating: true,
                      delegate: PlacePhotoHeader(
                          placeId: detailsEntity.placeId,
                          maxExtent: headerHeight,
                          photos: detailsEntity.photos)),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      PlaceDetailsContent(detailsEntity),
                    ]),
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
    BlocProvider.of<PlaceDetailsBloc>(ctx).add(GetPlaceDetailsEvent(placeId));
  }

  void _showCheckMarkModal() {
    scaffoldState.currentState!.showBottomSheet(
      (context) => CheckMarkModal(placeId: placeId),
      backgroundColor: Colors.transparent,
    );
    // showModalBottomSheet(
    //   context: context,
    //   backgroundColor: Colors.transparent,
    //   builder: (context) => CheckMarkModal(),
    // );
  }

  void _showRatingModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Text("rating"),
    );
  }
}
