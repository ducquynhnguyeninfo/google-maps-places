import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/features/places/data/datasources/local/models/checklist_item.dart';
import 'package:places/features/places/data/datasources/local/models/checklist_item_type.dart';
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
          var factory = ChecklistWidgetFactory();

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

class ChecklistWidgetFactory {
  Widget buildWidget(ChecklistItem item) {
    switch (item.type) {
      case ChecklistItemType.checkbox:
        return CheckboxType(item: item);
      case ChecklistItemType.rating:
        return Text('rating ${item.value}');
      case ChecklistItemType.photo:
        return Text('photo ${item.value}');
      default:
        return Text('Unsupported type "${item.type}" ${item.value}');
    }
  }
}

class CheckboxType extends StatefulWidget {
  final ChecklistItem item;

  const CheckboxType({Key? key, required this.item}) : super(key: key);

  @override
  _CheckboxTypeState createState() => _CheckboxTypeState();
}

class _CheckboxTypeState extends State<CheckboxType> {
  @override
  Widget build(BuildContext context) {
    if (widget.item.value == null) widget.item.value = false;
    return CheckboxListTile(
        value: widget.item.value,
        title: Text(widget.item.text),
        onChanged: (bool? value) {
          value = value ?? false;
          setState(() {
            widget.item.value = value;
          });
        });
  }
}
