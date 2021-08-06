import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/features/places/data/datasources/local/models/checklist_item.dart';
import 'package:places/features/places/data/datasources/local/models/checklist_item_type.dart';
import 'package:places/features/places/data/datasources/local/models/place_details_checklist.dart';
import 'package:places/features/places/presentation/screens/place_details/components/checklist/bloc/checklist_bloc.dart';
import 'package:places/features/places/presentation/widgets/modal.dart';
import 'package:places/values/app_colors.dart';
import 'package:places/values/size_config.dart';

class CheckMarkModal extends StatelessWidget {
  final String placeId;
  final TextEditingController textController = TextEditingController();

  CheckMarkModal({required this.placeId});

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
          title: 'Check mark',
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
                          hintText: 'Is floor clean? ect..',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Checkbox(
                      onChanged: (bool? value) {},
                      value: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              MaterialButton(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, left: 24, right: 16),
                onPressed: () async {
                  await _addCheckMarkItem(context);
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

  _addCheckMarkItem(BuildContext context) async {
    PlaceDetailChecklist? checklist =
        BlocProvider.of<ChecklistBloc>(context).checklist;
    if (checklist == null) {
      checklist = new PlaceDetailChecklist(placeId: placeId);
      // checklist.save();
    }

    var item = ChecklistItem(
        text: textController.text,
        type: ChecklistItemType.checkbox,
        value: true);
    // item.save();

    checklist.checklists.add(item);

    BlocProvider.of<ChecklistBloc>(context)
        .add(AddNewChecklistItemEvent(checklist));
  }
}
