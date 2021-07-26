import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:places/features/places/data/datasources/local/models/checklist_item.dart';
import 'package:places/features/places/data/datasources/local/models/checklist_item_type.dart';

class ChecklistWidgetFactory {
  Widget buildWidget(ChecklistItem item) {
    switch (item.type) {
      case ChecklistItemType.checkbox:
        return CheckboxType(item: item);
      case ChecklistItemType.rating:
        return RatingTypeWidget(item: item);
      case ChecklistItemType.photo:
        return Text('photo ${item.value}');
      default:
        return Text('Unsupported type "${item.type}" ${item.value}');
    }
  }
}

class RatingTypeWidget extends StatefulWidget {
  final ChecklistItem item;
  const RatingTypeWidget({Key? key, required this.item}) : super(key: key);

  @override
  _RatingTypeWidgetState createState() => _RatingTypeWidgetState();
}

class _RatingTypeWidgetState extends State<RatingTypeWidget> {

  @override
  void initState() {
    if (widget.item.value == null) widget.item.value = 0.0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.item.text, style: TextStyle(fontSize: 16)),
        RatingBar.builder(
          initialRating: widget.item.value,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 30,
          itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            widget.item.value = rating;
            widget.item.save();
          },
        ),
      ],
    );
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
  void initState() {
    super.initState();
    if (widget.item.value == null) widget.item.value = false;
  }
  @override
  Widget build(BuildContext context) {

    return CheckboxListTile(
        value: widget.item.value,
        title: Text(widget.item.text),
        onChanged: (bool? value) {
          value = value ?? false;
          setState(() {
            widget.item.value = value;
            widget.item.save();
          });
        });
  }
}