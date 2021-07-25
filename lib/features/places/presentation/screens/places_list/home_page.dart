import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_webservice/places.dart';

import 'package:places/config/dependency_injection.dart';
import 'package:places/features/places/data/datasources/remote_api/models/place_viewmodel.dart';
import 'package:places/values/size_config.dart';
import 'package:places/features/places/presentation/screens/places_list/bloc/places_list_bloc.dart';
import 'package:places/features/places/presentation/screens/places_list/components/list_item_view.dart';
import 'package:places/features/places/presentation/screens/places_list/components/list_item_view_shimmer.dart';

class HomePage extends StatefulWidget {
  static const String name = "home_page";

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var bloc = sl<PlacesListBloc>();
    print('hash bloc: ${bloc.hashCode}');

    return RepositoryProvider<PlacesListBloc>(
      create: (context) => bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Whizz Places App'),
          actions: [
            BlocBuilder<PlacesListBloc, PlacesListState>(
                builder: (context, state) => IconButton(
                      onPressed: () {
                        _loadCafes(context);
                      },
                      icon: Icon(Icons.refresh_rounded),
                      tooltip: 'Reload',
                    ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(SizeConfig.default_padding),
          child: BlocBuilder<PlacesListBloc, PlacesListState>(
              builder: (context, state) {
            if (state is PlacesListInitial) {
              _loadCafes(context);

              return _buildInitUI();
            }

            if (state is PlacesListLoading) {
              return _buildShimmerUI();
            }
            if (state is PlacesListLoaded) {
              List<PlaceViewModel> places = state.places;

              return ListView.builder(
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    return ListItemView(places[index]);
                  });
            }

            if (state is PlacesListEmpty) {
              return _buildEmptyUI();
            }
            if (state is PlacesListError) {
              return _buildErrorUI();
            }
            return _buildUnexpectedState();
          }),
        ),
      ),
    );
  }

  int loadTime = 0;

  void _loadCafes(BuildContext ctx) async {
    print('load count: ${++loadTime}');
    BlocProvider.of<PlacesListBloc>(ctx)
        .add(GetNearPlacesEvent('cafe'));
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
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListItemViewShimmer();
        });
  }

  Widget _buildUnexpectedState() {
    return Center(child: Text("Error: _buildUnexpectedState ..."));
  }
}
