import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_todo_app_mind_box/core/params/note_params.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/entities/note_entity.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/use_cases/add_note_use_case.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/use_cases/delete_note_use_case.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/use_cases/get_notes_use_case.dart';
import 'package:note_todo_app_mind_box/features/notes/domain/use_cases/update_note_use_case.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final GetNotesUseCase _getNotesUseCase;
  final AddNoteUseCase _addNoteUseCase;
  final UpdateNoteUseCase _updateNoteUseCase;
  final DeleteNoteUseCase _deleteNoteUseCase;

  NotesBloc(
    this._getNotesUseCase,
    this._addNoteUseCase,
    this._updateNoteUseCase,
    this._deleteNoteUseCase,
  ) : super(NotesInitial()) {
    // G E T
    on<GetNotesEvent>((event, emit) async {
      emit(NotesLoading());

      final results = await _getNotesUseCase.call(
        title: event.title.isEmpty ? null : event.title,
      );

      results.fold(
        (failure) => emit(NotesError(message: failure.message)),
        (notes) => emit(NotesLoaded(notes: notes)),
      );
    });

    // A D D
    on<AddNoteEvent>((event, emit) async {
      emit(NotesLoading());

      final results = await _addNoteUseCase.call(
        NoteParams(
          title: event.params.title,
          content: event.params.content,
          color: event.params.color,
        ),
      );

      results.fold(
        (failure) => emit(NotesError(message: failure.message)),
        (success) => emit(SuccessProcess()),
      );
    });

    // U P D A T E
    on<UpdateNoteEvent>((event, emit) async {
      emit(NotesLoading());

      final results = await _updateNoteUseCase.call(event.params);

      results.fold(
        (failure) => emit(NotesError(message: failure.message)),
        (success) => emit(SuccessProcess()),
      );
    });

    // D E L E T E
    on<DeleteNoteEvent>(
      (event, emit) async {
        emit(NotesLoading());

        final results = await _deleteNoteUseCase.call(id: event.id);

        results.fold(
          (failure) => emit(NotesError(message: failure.message)),
          (success) => emit(SuccessProcess()),
        );
      },
    );
  }
}
