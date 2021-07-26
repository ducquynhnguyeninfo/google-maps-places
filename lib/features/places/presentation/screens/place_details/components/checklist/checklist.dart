import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/config/dependency_injection.dart';
import 'package:places/features/places/data/datasources/local/models/checklist_item.dart';
import 'package:places/features/places/data/datasources/local/models/checklist_item_type.dart';
import 'package:places/features/places/presentation/screens/place_details/components/checklist/widgets/widget_factory.dart';
import 'package:places/values/app_colors.dart';
import 'package:places/values/size_config.dart';
import 'package:shimmer/shimmer.dart';

import 'bloc/checklist_bloc.dart';

class Checklist extends StatefulWidget {
  final String placeId;

  const Checklist({Key? key, required this.placeId}) : super(key: key);

  @override
  _ChecklistState createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChecklistBloc>(context)
        .add(GetChecklistEvent(widget.placeId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChecklistBloc, ChecklistState>(
      builder: (context, state) {
        if (state is ChecklistLoading) {
          return _buildShimmer();
        }

        if (state is ChecklistLoaded) {
          var factory = sl<ChecklistWidgetFactory>();

          var list = state.checklist.checklists
              .map((e) => factory.buildWidget(e))
              .toList();

          return Column(
            children: list,
          );
        }

        return Text("checklist issues");
      },
    );
  }

  Widget _buildShimmer() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: SizeConfig.default_padding),
          child: Shimmer.fromColors(
              child: Container(
                height: 40.0,
                color: AppColors.shimmerColor,
              ),
              baseColor: AppColors.shimmerColor,
              highlightColor: AppColors.shimmerHighlightColor),
        );
      },
    );
  }
}

