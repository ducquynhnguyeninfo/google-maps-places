part of 'checklist_bloc.dart';

abstract class ChecklistEvent extends Equatable {
  const ChecklistEvent();
}

class GetChecklistEvent extends ChecklistEvent {
  final String placeId;

  const GetChecklistEvent(this.placeId);

  @override
  List<Object?> get props => [placeId];
}


class AddNewChecklistItemEvent extends ChecklistEvent {
  final PlaceDetailChecklist checklist;

  const AddNewChecklistItemEvent(this.checklist);

  @override
  List<Object?> get props => [checklist];
}

class RemoveChecklistItemEvent extends ChecklistEvent {
  final ChecklistItem item;

  const RemoveChecklistItemEvent(this.item);

  @override
  List<Object?> get props => [item];
}
