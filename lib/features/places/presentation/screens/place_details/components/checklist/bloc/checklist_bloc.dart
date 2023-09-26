import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:places/features/places/data/datasources/local/models/checklist_item.dart';
import 'package:places/features/places/data/datasources/local/models/checklist_item_type.dart';
import 'package:places/features/places/data/datasources/local/models/place_details_checklist.dart';
import 'package:places/features/places/domain/usecases/checklist_get_usecase.dart';
import 'package:places/features/places/domain/usecases/checklist_save_usecase.dart';

part 'checklist_event.dart';

part 'checklist_state.dart';

class ChecklistBloc extends Bloc<ChecklistEvent, ChecklistState> {
  final GetChecklistUsecase getChecklistUsecase;
  final SaveChecklistUsecase saveChecklistUsecase;

  ChecklistBloc(this.getChecklistUsecase, this.saveChecklistUsecase)
      : super(ChecklistInitial());

  PlaceDetailChecklist? checklist;

  @override
  Stream<ChecklistState> mapEventToState(
    ChecklistEvent event,
  ) async* {
    if (event is GetChecklistEvent) {
      yield* _getPlaceChecklist(event);
    }

    if (event is AddNewChecklistItemEvent) {
      yield* _savePlaceChecklist(event);
    }

    if (event is RemoveChecklistItemEvent) {}
  }

  Stream<ChecklistState> _getPlaceChecklist(GetChecklistEvent event) async* {
    yield ChecklistLoading();

    var result = await getChecklistUsecase.call(event.placeId);

    yield* result.when((PlaceDetailChecklist success) async* {
      checklist = success; // caching
      yield ChecklistLoaded(success);
    }, (error) async* {
      yield ChecklistError(error.runtimeType.toString());
    });
  }

  Stream<ChecklistState> _savePlaceChecklist(
      AddNewChecklistItemEvent event) async* {
    yield ChecklistLoading();
    await saveChecklistUsecase.call(event.checklist);
    var result = await getChecklistUsecase.call(event.checklist.placeId);

    yield* result.when(
      (PlaceDetailChecklist success) async* {
        checklist = success;
        yield ChecklistLoaded(success);
      },
      (error) async* {
        yield ChecklistError(error.runtimeType.toString());
      },
    );
  }
}
