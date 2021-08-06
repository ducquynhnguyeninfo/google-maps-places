import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:places/features/places/data/datasources/local/models/checklist_item.dart';
import 'package:places/features/places/data/datasources/local/models/checklist_item_type.dart';
import 'package:places/features/places/data/datasources/local/models/place_details_checklist.dart';
import 'package:places/features/places/presentation/screens/place_details/components/checklist/bloc/checklist_bloc.dart';
import 'package:places/features/places/presentation/widgets/modal.dart';
import 'package:places/values/app_colors.dart';
import 'package:places/values/size_config.dart';

class RatingModal extends StatelessWidget {
  final String placeId;
  final TextEditingController textController = TextEditingController();

  RatingModal({required this.placeId});

  double rateValue = 0;

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets.bottom + 14;

    return DraggableScrollableSheet(
      // return Deg
      expand: true,
      initialChildSize: 0.7,
      maxChildSize: 1,
      minChildSize: 0.5,
      builder: (_, scrollController) {
        return Modal(
          title: 'Rating',
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 18),
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.default_padding),
                decoration: ShapeDecoration(
                  shape: StadiumBorder(),
                  color: Colors.grey[50],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.sticky_note_2_outlined),
                    SizedBox(width: 13),
                    Expanded(
                      child: TextFormField(
                        controller: textController,
                        decoration: InputDecoration(
                          hintText: 'Ex: How you love the drink?',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 40,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  rateValue = rating;
                },
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, left: 24, right: 16),
                onPressed: () async {
                  await _addRatingItem(context);
                  Navigator.of(context).pop();
                },
                color: AppColors.mainColor,
                splashColor: Colors.grey.withOpacity(0.1),
                highlightColor: Colors.grey.withOpacity(0.1),
                elevation: 2,
                highlightElevation: 2,
                disabledColor: Colors.grey,
                child: Text("Save",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }

  _addRatingItem(BuildContext context) {
    PlaceDetailChecklist? checklist =
        BlocProvider.of<ChecklistBloc>(context).checklist;
    if (checklist == null) {
      checklist = new PlaceDetailChecklist(placeId: placeId);
    }

    var item = ChecklistItem(
        text: textController.text,
        type: ChecklistItemType.rating,
        value: this.rateValue);

    checklist.checklists.add(item);

    BlocProvider.of<ChecklistBloc>(context)
        .add(AddNewChecklistItemEvent(checklist));
  }
}
