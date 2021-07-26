part of 'checklist_bloc.dart';

abstract class ChecklistState extends Equatable {
  const ChecklistState();
}

class ChecklistInitial extends ChecklistState {
  @override
  List<Object> get props => [];
}

class ChecklistLoading extends ChecklistState {
  @override
  List<Object> get props => [];
}

class ChecklistLoaded extends ChecklistState {
  final PlaceDetailChecklist checklist;

  ChecklistLoaded(this.checklist);

  @override
  List<Object> get props => [checklist];
}

class ChecklistError extends ChecklistState {
  final String message;

  ChecklistError(this.message);

  @override
  List<Object> get props => [message];
}
